set more off
clear all
cls 

// Use this code to download, build, and save to the local computer data 
// from the FALL ENROLLMENT survey (B Series) at the US DOE's Integrated
// Postsecondary Education Data Stystem.

// Mar/2018:  Naiya Patel - Completed B Series.  
// Feb/2018:  Naiya Patel - Original author, initial build.

/*#############################################################################

File maintained at
https://github.com/adamrossnelson/StataIPEDSAll

##############################################################################*/

// Utilizes sshnd (interactive file picker)
do https://raw.githubusercontent.com/adamrossnelson/sshnd/master/sshnd.do

capture log close                             // Close stray log files.
log using "$loggbl", append                   // Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)  // Define spacer.
version 13                                    // Enforce version compatibility.
di c(pwd)                                     // Confirm working directory.

clear all                                     // Reset the workspace
cd "$wkdgbl"                                  // Change back to working directory.

forvalues yindex = 2002 / 2016 {
	// Copy, unzip, and import data files.
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Data_Stata.zip .
	unzipfile EF`yindex'B_Data_Stata.zip, replace

	// Download the NCES provided do file for B series 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Stata.zip .
	unzipfile EF`yindex'B_Stata.zip, replace 

	// Read do file into scalar for modification. 
	scalar fcontents = fileread("EF`yindex'B.do")

	// Remove default "insheet" command designed to import data. 
	// Remove default "save" command designed to save data. 
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)

	// Remove unexpected carriage returns and line feeds. 
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)

	// Save, rename, and run the revised and working do file. 
	scalar byteswritten = filewrite("EF`yindex'b.do", fcontents, 1)
	
	// File name convetions not consistent through the years.
	// 2007-2014   provide _rv_ editions of the data.
	if `yindex' > 2006 & `yindex' < 2016 {
		import delimited ef`yindex'b_rv_data_stata.csv, clear
	}
	else {
		import delimited ef`yindex'b_data_stata.csv, clear
	}

	di "QUIET RUN OF EF`yindex'b.do" 
	qui do EF`yindex'b
	drop x*
	di `sp'
	
	rename 	efage01	fttotm	                 // Full time total men
	rename	efage02 fttotw                   // Full time total women
	rename	efage03 pttotm                   // Part time total men
	rename	efage04 pttotw                   // Part time total women
	rename	efage05 ftgtot 	                 // Full time grand total
	rename	efage06 ptgtot                   // Part time grand total 
	rename	efage07 totlmn                   // Total men
	rename	efage08 totlwm                   // Total women
	rename	efage09 grndtl	                 // Grand total, both men and women

	// Establish local for varlist
	local thevars fttotm fttotw pttotm pttotw ftgtot ///
	ptgtot totlmn totlwm grndtl 
	
	// Loop to save variable label names for reapplication after reshape
	foreach varname in `thevars' {
		local l`varname' : variable label `varname'
	}

	// Simplfy the dataset - Keeping undergraduate leve data only.
	keep if lstudy == 2                      // Keeping undergraduate lstudy.
	keep unitid efbage `thevars'
	
	// Store levels of efbage in a local levels
	levelsof efbage, local(levels)
	// Get the value lable name associated with var efbage
	local lbe : value label efbage 
	// Get individual value labels from valuelabel associated with var efbage
	foreach l of local levels {
		local ms_`l' : label `lbe' `l' 
	}

	// Reshape
	reshape wide `thevars', i(unitid) j(efbage)
	
	// Reapply variable label names following reshape. 
	foreach lev of local levels {
		foreach varname in `thevars' {
			label variable `varname'`lev' "`ms_`lev'' `l`varname''"
		}	
	}

	// Document lstudy, kept undergraduate lstudy for this dataset
	// Store lstudy information in variable label information.
	foreach varname of var * {
		// Set local = to existing variable label.
		local curlab : variable label `varname'
		// Concatenate new text with local.
		local newlab = "Ugrd Stus, `curlab'"
		// use local to set new variable label.
		label variable `varname' "`newlab'"
	}
	label variable unitid "Institutional unitid"

	// Add isYr index and order new variable. 
	gen int isYr = `yindex'
	order isYr, after (unitid)
	compress 
	saveold EF`yindex'B_data_stata.dta, replace version (13)
	di `sp'
}

use ef2016b_data_stata.dta, clear 
forvalues yindex = 2015(-1)2002 {
	display "Appending data file from `yindex'"               // Output for log file.
	append using "ef`yindex'b_data_stata.dta", force
	di `sp'	                                                  // Spacing for log file.
}
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
