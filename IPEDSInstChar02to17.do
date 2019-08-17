set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the INSTITUTIONAL CHRACTERISTICS survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.

// Jan/2019:    Adam Ross Nelson - Refactored, reduced line count.
// Dec/2018:    Adam Ross Nelson - Updated to include 2017 datafiles.
// Jan/2018: 	Naiya Patel 	 - Updated to include 2016 (rv) datafiles. 
// Oct/2017:	Adam Ross Nelson - Updated to include 2016 datafiles.
// Sep/2017:	Adam Ross Nelson - Updated to use sshnd file picker.
// Sep/2017:	Adam Ross Nelson - GitHub ReBuild.
// Apr/2017:	Adam Ross Nelson - Initial Build.

/*#############################################################################

      File maintained at
	  https://github.com/adamrossnelson/StataIPEDSAll
  
##############################################################################*/

// Utilizes preckage version of sshnd (interactive file picker)/
// Stable 1.0 version of sshnd documentation available at:
// https://github.com/adamrossnelson/sshnd/tree/1.0
do https://raw.githubusercontent.com/adamrossnelson/sshnd/master/sshnd.do

capture log close                               // Close stray log files.
log using "$loggbl", append                     // Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)    // Define spacer.
version 13                                      // Enforce version compatibility.
di c(pwd)                                       // Confrim working directory.

// Loop designed to download zip files and NCES provided Stata do files.
// Stata do files need cleaning (remove stray char(13) + char(10) + char(34)).
// ADM series (Admissions and Test Scores) Introduced in 2014
forvalues fname = 2014/2017 {
	// Copy and unzip data and do files.
	// Stata 13 introduced support for copy to work with https.
	// Use command -update all- if Stata 13 and copy returns an error.
	copy https://nces.ed.gov/ipeds/datacenter/data/ADM`fname'_Data_Stata.zip .
	unzipfile ADM`fname'_Data_Stata.zip, replace
	copy https://nces.ed.gov/ipeds/datacenter/data/ADM`fname'_Stata.zip .
	unzipfile ADM`fname'_Stata.zip
	
	// The NCES provided do files have some lines that need to be removed
	// before we can call them from this master -do-file.
	scalar fcontents = fileread("adm`fname'.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	
	// Save edited do file.
	scalar byteswritten = filewrite("adm`fname'.do", fcontents, 1)
	di `sp'								// Spacing to assist reading output.
}

// TODO: Place these four years of adm20YY_rv_data_stata in for loop.
// DONE: Created for loop. Jan 2019. - arn (Remove comment in future commit)

forvalues fname = 2014/2017 {
	if `fname' > 2007 & `fname' < 2017 {
		import delimited adm`fname'_rv_data_stata.csv, clear
	}
	else {
		import delimited adm`fname'_data_stata.csv, clear
	}
	// import delimited adm`fname'_rv_data_stata.csv, clear
	di "QUIET RUN OF adm`fname'.do"            // Provide uers with information for log file.
	qui do adm`fname'                          // Quietly run NCES provided do file.
	gen isYr = `fname'	                       // Add the isYr index for later merge.
	order isYr, after(unitid)                  // Order isYr after unitid, easier browsing.
	compress
	saveold adm`fname'_data_stata.dta, version(13) replace
	di `sp'	
}

// Loop designed to downlaod zip files and NCES provided Stata do files.
// Stata do files need cleaning (remove stray char(13) + char(10) + char(34)).
forvalues fname = 2002 / 2017 {
	// Copy, unzip, and import data.
	copy https://nces.ed.gov/ipeds/datacenter/data/IC`fname'_Data_Stata.zip .
	unzipfile IC`fname'_Data_Stata.zip, replace
	// File name conventions not consistent through the years. 2002-2007 
	// and 2009 no _rv_ file. 2008 and 2010-2016 _rv_ file available.	
	if `fname' == 2008 | (`fname' > 2009 & `fname' < 2017) {
		import delimited ic`fname'_rv_data_stata.csv, clear
	}
	else {
		import delimited ic`fname'_data_stata.csv, clear
	}

	// Add isYr for later panel merge. Order new variable.
	gen int isYr = `fname'
	order isYr, after(unitid)

	// Download NCES provided do files.
	copy https://nces.ed.gov/ipeds/datacenter/data/IC`fname'_Stata.zip .
	unzipfile IC`fname'_Stata.zip
	// Read do file into scalar for modification.
	// Remove default "insheet" command designed to import data.
	// Remove default "save" command designed to save data.
	scalar fcontents = fileread("ic`fname'.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	// These lines clear erroneous code form the 2003 do file.
	scalar fcontents = subinstr(fcontents, "label define label_chfnm", "*label define label_chfnm Alpha", .)
	// Remove unexpected carriage returns and line feeds.
	scalar sstring = char(13) + char(10) + char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	// Save (and call) the revised and working do file.
	scalar byteswritten = filewrite("ic`fname'.do", fcontents, 1)
	di "QUIET RUN OF ic`fname'"                    // Provide information for log file.
	qui do ic`fname'			       // Quietyly run NCES provided do file.
	di `sp'	                                       // Spacing to assist reading output.

	// Compress and save the resulting do file.
	compress
	saveold ic`fname'_data_stata.dta, version(13) replace
	di `sp'                                        // Spacer for the output.
}

// Loop through dta files created above. Assemble panel data set. Starts with
// most recent dta file. Procedure assumes most recent dta value lables will
// be most valid and reliable for the intended research or analytical purpose.
di `sp'	                                            // Spacer for the output.
use ic2017_data_stata.dta, clear                    // Open most recent file as the
forvalues yindex = 2016(-1)2002 {                   // base (2017) and then, assemble
	append using ic`yindex'_data_stata.dta, force   // panel data set.
	di `sp'                                         // Spacer for the output.
}
forvalues yindex = 2014/2017 {
	merge 1:1 unitid isYr using "adm`yindex'_data_stata.dta", ///
	nogenerate update force
}

// Correct duplicate value labels (which will work with Stata). But causes
// error when using data in other settings (e.g. Python Pandas).
// Documentation: https://stackoverflow.com/a/46038793/9572143
qui labelbook, length(12)
qui return list, all
qui numlabel `r(nuniq)', add

// Move up file directory level, compress, add notes.
// Save resulting panel data set.
cd ..
drop x*
compress
label data "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll"
notes _dta: "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll"
notes _dta: "Panel built on `c(current_date)'"
notes _dta: "Note regarding history of IC and ADM survey files. ADM . . ."
notes _dta: "series introduced in 2014 Some variables formerly found . . ."
notes _dta: "in the IC series moved to ADM series."
saveold "$dtagbl", replace version(13)

qui { 
noi di as result "#####################################################################"
noi di as result ""
noi di as result "      Saved $dtagbl"
noi di as result ""
noi di as result "	  Note regarding history of IC and ADM survey files. ADM series"
noi di as result "	  introduced in 2014. Some variables formerly found in the IC"
noi di as result "	  series moved to ADM series. This routine builds ADM and IC"
noi di as result "	  sets apart. Then merges the 2014 through 2017 ADM surveys."
noi di as result ""
noi di as result "	  Also note description of ADM series from NCES dictionary..."
noi di as result "	  These [ADM] data are applicable for institutions that do not"
noi di as result "	  have an open admin... policy for entering first-time students."
noi di as result ""
noi di as result "######################################################################"
}
log close
