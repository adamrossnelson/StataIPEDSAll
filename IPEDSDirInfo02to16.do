set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the DIRECTORY INFORMATION survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.

// Feb/2017:    Adam Ross Nelson - Created locale1 urbanicity crosswalk.
// Oct/2017:	Adam Ross Nelson - Updated to include 2016 datafiles.
// Sep/2017:	Adam Ross Nelson - Updated to use sshnd file picker.
// Sep/2017:	Adam Ross Nelson - GitHub ReBuild.
// Apr/2017:	Adam Ross Nelson - Initial Build.

/*#############################################################################

      Maintained/more information at:
	  https://github.com/adamrossnelson/StataIPEDSAll
  
##############################################################################*/

// Utilizes preckage version of sshnd (interactive file picker)/
// Stable 1.0 version of sshnd documentation available at:
// https://github.com/adamrossnelson/sshnd/tree/1.0
do https://raw.githubusercontent.com/adamrossnelson/sshnd/master/sshnd.do

capture log close                             // Close stray log files.
log using "$loggbl", append                   // Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)  // Define spacer.
version 13                                    // Enforce version compatibility.
di c(pwd)                                     // Confrim working directory.

// Loop is designed to downlaod zip files and NCES provided Stata do files.
// Stata do files need cleaning (removal stray char(13) + char(10) + char(34)).
forvalues fname = 2002 / 2016 {
	// Copy, unzip, and import data.
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
gen locale1 = locale
replace locale1 = 11 if locale1 == 1  // Large city               > City: Large
replace locale1 = 12 if locale1 == 2  // Mid-size city            > City: Midsize
replace locale1 = 21 if locale1 == 3  // Urb frnge of lrg cty     > Suburb: Large
replace locale1 = 22 if locale1 == 4  // Urb frnge of mid-sze cty > Suburb: Midsize
replace locale1 = 31 if locale1 == 5  // Large town               > Town: Fringe
replace locale1 = 32 if locale1 == 6  // Small town               > Town: Distant
replace locale1 = 33 if locale1 == 7  // Rural                    > Town: Remote
label variable locale1 "Crosswalked 2004, 2003, 2002 alues of locale. See do file."

// Second copy the 2005 index back to 2004, 2003, and 2004
qui tab isYr
sort unitid isYr
gen locale2 = locale
replace locale2 = locale2[_n+1] if unitid == unitid[_n+1] & isYr < 2005 & isYr > 2001
label values locale2 label_locale
label variable locale2 "Copy 2005 value of -locale- to 2004, 2003, & 2002"

// Third, utilize latest non-missing value for all years.
// Also, utilize this loop to copy f1systyp f1sysnam f1syscod which were
// not available before 2013.
gen f1systyp2 = f1systyp 
gen f1sysnam2 = f1sysnam 
gen f1syscod2 = f1syscod
order f1systyp2 f1sysnam2 f1syscod2, after(f1syscod)
qui tab isYr
sort unitid isYr
gen locale3 = locale
foreach icount of numlist 1/`r(r)' {
	replace locale3 = locale3[_n+1] if unitid == unitid[_n+1]
	replace f1systyp2 = f1systyp2[_n+1] if unitid == unitid[_n+1]
	replace f1sysnam2 = f1sysnam2[_n+1] if unitid == unitid[_n+1]
	replace f1syscod2 = f1syscod2[_n+1] if unitid == unitid[_n+1]
}
label values locale3 label_locale		
order locale*, after(tribal)
label variable f1systyp2 "Multi-institution or multi-campus organization"
label variable f1sysnam2 "Name of multi-institution or multi-campus organization"
label variable f1syscod2 "Identification number of multi-institution or multi-campus organization"
label values f1systyp2 label_f1systyp
label values f1syscod2 label_f1syscod

// Move up file directory level, compress, add notes.
// Save resulting panel data set.
cd ..
compress
label data "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll/tree/master"
notes _dta: "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll/tree/master"
notes _dta: "Panel built on `c(current_date)'"
saveold "$dtagbl", replace version(13)

qui { 
noi di "#####################################################################"
noi di ""
noi di "      Saved $dtagbl"
noi di ""
noi di "######################################################################"
}
log close
