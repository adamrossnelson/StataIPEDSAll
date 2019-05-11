set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the DIRECTORY INFORMATION survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.

// May/2019     Adam Ross Nelson - Updated to include 2017 datafiles.
// Jan/2018: 	Naiya Patel 	 - Edited/cleaned up code using rename function.
// Oct/2017:	Adam Ross Nelson - Updated to include 2016 datafiles.
// Oct/2017:	Adam Ross Nelson - Updated to use sshnd file picker.
// Oct/2017:	Adam Ross Nelson - GitHub ReBuild.
// Apr/2017:	Adam Ross Nelson - Initial build.

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

forvalues yindex = 2002 / 2017 {
	// Stata 13 introduced support for copy to work with https.
	// Use command -update all- if Stata 13 and copy returns an error.
	copy https://nces.ed.gov/ipeds/datacenter/data/EFFY`yindex'_Data_Stata.zip .
	unzipfile EFFY`yindex'_Data_Stata.zip, replace
	
	copy https://nces.ed.gov/ipeds/datacenter/data/EFFY`yindex'_Stata.zip .
	unzipfile EFFY`yindex'_Stata.zip, replace

	// The NCES provided -do- files hae some lines that need to be removed
	// before we can call them from the master -do- file.
	scalar fcontents = fileread("effy`yindex'.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)

	scalar byteswritten = filewrite("effy`yindex'.do", fcontents, 1)
	
	// Naming conventions changed. Manage evolving name conventions.
	// 2002 to 2006 & 2015 no revised survey data file.
	if `yindex' < 2007 | `yindex' > 2014 {
		import delimited effy`yindex'_data_stata.csv, clear
	}
	else {
		import delimited effy`yindex'_rv_data_stata.csv, clear
	}
	
	// Run the NCES provided do files.
	di "QUIET RUN OF effy`yindex'.do" // Provide ser information for log file.
	qui do effy`yindex'.do			  // Quiety run NCES provided do files.
	
	// Drop the imputation fields and lstudy which is effylev redundant.
	drop x*							// Remove imputation flags, reduce filesize.
	drop lstudy						// lstudy not consistent. Remove to simplify.

	// Make adjustments for changes in variable names.
	if `yindex' < 2008 {
		rename fyrace01 efynralm 	// Nonresident alien men 
		rename fyrace02 efynralw	// Nonresident alien women
		rename fyrace13 efyunknm	// Race/ethnicity unknown men
		rename fyrace14 efyunknw	// Race/ethnicity unknown women
		rename fyrace15 efytotlm	// Grand total men
		rename fyrace16 efytotlw	// Grand total women 
		rename fyrace17	efynralt	// Nonresident alien total
		rename fyrace23	efyunknt	// Race/ethnicity unknown total
		rename fyrace24 efytotlt	// Grand total
	}	

	// Save a copy of the effy file with all three levels for later reference.
	saveold "effy`yindex'_data_stata.dta", version(13) replace
	di `sp'							  // Spacer for the output.
	
/*######################################################################
				This block of code reshapes the data. reshape (command) 
				might be a better approach. Advantage of not using reshape
				is opportunity to modify data lables for better 
				identification of variables with -desc-, -codebook-.
#######################################################################*/

	// Proceed to prepare the ALL Students Level set of effy variables.	
	di "          Keeping only effylev == 1 to prepare the ALL version of this file"
	keep if effylev == 1
	rename * *all
	rename unitidall unitid
	drop effylev*
	
	// Foreach loop adds "ALL" previx to all of the variable lables.
	// Which will make identifying the level in wide format more intuitive.
	foreach varname of varlist _all {
		local templab : var label `varname'
		label variable `varname' "ALL `templab'" 
	}
	// Restores the unitid variable lable to default.
	label variable unitid "Unique identification number of the institution"
	saveold "effy`yindex'_data_stata.all.dta", version(13) replace
	
	// Proceed to prepare the Undergraduate Level set of effy variables.	
	di "          Keeping only effylev == 2 to prepare the UGR version of this file"
	use effy`yindex'_data_stata.dta, clear
	keep if effylev == 2
	rename * *ugr
	rename unitidugr unitid
	drop effylev*
	
	// Foreach loop adds "UGR" previx to all of the variable lables.
	// Which will make identifying the level in wide format more intuitive.
	foreach varname of varlist _all {
		local templab : var label `varname'
		label variable `varname' "UGR `templab'" 
	}
	// Restores the unitid variable lable to default.
	label variable unitid "Unique identification number of the institution"	
	saveold "effy`yindex'_data_stata.ugr.dta", version(13) replace
	
	// Proceed to prepare the Graduate Level set of effy variables.
	di "          Keeping only effylev == 3 to prepare the GRA version of this file"
	use effy`yindex'_data_stata.dta, clear
	keep if effylev == 4
	rename * *gra
	rename unitidgra unitid
	drop effylev*
	
	// Foreach loop adds "GRA" previx to all of the variable lables.
	// Which will make identifying the level in wide format more intuitive.
	foreach varname of varlist _all {
		local templab : var label `varname'
		label variable `varname' "GRA `templab'" 
	}
	// Restores the unitid variable lable to default.
	label variable unitid "Unique identification number of the institution"	
	saveold "effy`yindex'_data_stata.gra.dta", version(13) replace
	
	di `sp'							  // Spacer for the output.

/*######################################################################
				Note: End of code block used to reshape.
#######################################################################*/	
	
	// Rebuild the effy data in wide format.
	di "          Rebuilding the WIDE version of this file"	

	use effy`yindex'_data_stata.all.dta, clear
	merge 1:1 unitid using "effy`yindex'_data_stata.ugr.dta", nogenerate
	merge 1:1 unitid using "effy`yindex'_data_stata.gra.dta", nogenerate
	
	gen int isYr = `yindex'			// Add the isYr index for later merge.
	order isYr, after(unitid)		// Order isYr after unitid, easier browsing.
	saveold "effy`yindex'_wide_data_stata.dta", version(13) replace
	di `sp'
}

// Build the multi-year panel data set.
use effy2017_wide_data_stata.dta, clear					// Open most recent file
forvalues fname = 2016(-1)2002 {						// as the base. Then,
	append using effy`fname'_wide_data_stata.dta, force // assemble the panel set.
}

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
