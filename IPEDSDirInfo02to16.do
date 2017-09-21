set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the Directory Information survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.

// Initial build: 			Spring 2017
// GitHub rebuild:			September 2017
// Original Author:			Adam Ross Nelson

/*######################################################################

      This do file will place in c:\statadata "Directory Info 02 to 16.dta"

	  This do file is maintained by Adam Ross Nelson JD PhD at
	  https://github.com/adamrossnelson/StataIPEDSAll
	  
	  Note: Requires pre-established directory c:\statadata
	  
	  Questions or comments via GitHub or Twitter @adamrossnelson
	  
########################################################################*/

sleep 5000												// [ 5 second pause ]

// Utilize existing directory structure
cd c:/statadata

capture log close										// Close stray log files.
log using "IPEDSDirInfo `c(current_date)'.txt", replace	// Open new log file.
local sp char(13) char(10) char(13) char(10) char(13) char(10) // Define spacer.
version 13									// Enforce version compatibility.
capture mkdir workspace						// Make a directory to store zip files.
cd workspace								// Move into working directory.

// Loop is designed to downlaod zip files and NCES provided Stata do files.
// Stata do files need cleaning (removal stray char(13) + char(10) + char(34)).
forvalues fname = 2002 / 2016 {
		// Copy, unzip, and importa data.
	copy https://nces.ed.gov/ipeds/datacenter/data/HD`fname'_Data_Stata.zip .
	unzipfile HD`fname'_Data_Stata.zip, replace
	import delimited hd`fname'_data_stata.csv
		// Add isYr index for later panel merge. Order new variable.
	gen int isYr = `fname'
	order isYr, after(unitid)

		// Download the NCES provided do file.
		// NCES do file provides variable lables for IPEDS data.
	copy https://nces.ed.gov/ipeds/datacenter/data/HD`fname'_Stata.zip .
	unzipfile HD`fname'_Stata.zip, replace
		// Read do file into scalar for modification.
		// Remove default "insheet" command designed to import data.
		// Remove default "save" command desigend to save data.
	scalar fcontents = fileread("hd`fname'.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
		// NCES provided do files (early 2000s) utilize conventions that
		// error in later versions of Stata. Remove those lines.
		// These lines clear erroneous code from the 2002 do file.
	scalar fcontents = subinstr(fcontents, "label define label_stabbr", "*label define label_stabbr", .)
	scalar fcontents = subinstr(fcontents, "label values stabbr label_stabbr", "*label values stabbr label_stabbr", .)
	scalar fcontents = subinstr(fcontents, "label define label_act", "*label define label_act", .)
	scalar fcontents = subinstr(fcontents, "label values act label_act", "*label values act label_act", .)
		// These lines clear erroneous code from the 2003 do file.
	scalar fcontents = subinstr(fcontents, "label define label_chfnm", "*label define label_chfnm Alpha", .)
	scalar fcontents = subinstr(fcontents, "label values chfnm label_chfnm", "*label values chfnm label_chfnm", .)
		// These lines clear erroneous code from the 2004 do file.
	scalar fcontents = subinstr(fcontents, "label define label_chftitle", "*label define label_chftitle Alpha", .)
	scalar fcontents = subinstr(fcontents, "label values chftitle label_chftitle", "*label values chftitle label_chftitle", .)
	scalar fcontents = subinstr(fcontents, "label define label_webaddr", "*label define label_webaddr Alpha ", .)
	scalar fcontents = subinstr(fcontents, "label values webaddr label_webaddr", "*label values webaddr label_webaddr", .)
	scalar fcontents = subinstr(fcontents, "label define label_closedat", "*label define label_closedat", .)
	scalar fcontents = subinstr(fcontents, "label values closedat", "*label values closedat", .)
		// Remove unexpected carriage returns and line feeds.
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)	
		// Save (and call) the revised and working do file.
	scalar byteswritten = filewrite("hd`fname'.do", fcontents, 1)
	di "QUIET RUN OF hd`fname'.do"		// Provid user with information for log file.
	qui do hd`fname'					// Quietyly run NCES provided do files.
	di `sp'								// Spacing to assist reading output.
	
		// Compress and save the resulting do file.
	compress
	saveold hd`fname'_data_stata.dta, replace version(13)
	di `sp'									// Spacing to assist reading output.
	clear
	}
		
// Loop through dta files created above. Assmble panel data set. Starts with 
// most recent dta file. Procedure assumes most recent dta value labels will 
// be most valid and reliable for the intended research or analytical purpose.
use hd2016_data_stata.dta, clear
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"						// Output for log file.
	append using "hd`yindex'_data_stata.dta", force
	di `sp'									// Spacing for log file.
}
		
// In 2005 urbanicity index changed. Three options.
// First, match pre-2005 index to the the 2005 index.
	/* -- To be implemented -- */
	/* -- Needs consensus on appropriate cross-walk */

// Second copy the 2005 index back to 2004, 2003, and 2004
qui tab isYr
sort unitid isYr
gen locale2 = locale
forvalues icount = 2004(-1)2002 {
	replace locale2 = locale2[_n+1] if unitid == unitid[_n+1] & isYr == `icount'
}
label values locale2 label_locale

// Third, utilize latest non-missing value for all years.
qui tab isYr
sort unitid isYr
gen locale3 = locale
foreach icount of numlist 1/`r(r)' {
	replace locale3 = locale3[_n+1] if unitid == unitid[_n+1]
}
label values locale3 label_locale		
order locale*, after(tribal)

// Move up file directory level.
// Save resulting panel data set.
cd ..
saveold "Directory Info 02 to 16.dta", replace version(13)

/*######################################################################

      Now located in c:\statadata is "Directory Info 02 to 16.dta"

	  This do file is maintained by Adam Ross Nelson JD PhD at
	  https://github.com/adamrossnelson/StataIPEDSAll
	  
	  Questions or comments via GitHub or Twitter @adamrossnelson

########################################################################*/
