set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the FALL ENROLLMENT survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.
//***Add note: we will only worry about A and B for now, C will be for future 
//***development. 

// Feb/2018:     Naiya Patel - Original author, initial build.

/*#############################################################################

      File maintained at
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

//Look is designed to download zip files and NCES provided Stata do files. 
//Stat do files need cleaning (removal of stray char(13) + char(10) + char(34)).
forvalues yindex = 2002 / 2016 {
	//Copy, unzip, and import data files. 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'A_Data_Stata.zip .
	unzipfile EF`yindex'A_Data_Stata.zip
	//Download the NCES provided do file for A series 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'A_Stata.zip .
	unzipfile EF`yindex'A_Stata.zip, replace
	//Read do file into scalar for modification. 
	scalar fcontents = fileread("EF`yindex'A.do")
	//Remove default "insheet" command designed to import data. 
	//Remove defualt "save" command designed to save data.
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	//Remove unexpected carriage returns and line feeds. 
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	//Save, rename, and run the revised and working do file.  // Lines from the gr2002 files that need to be removed.
    scalar fcontents = subinstr(fcontents, "label define label_line", "// label define label_line", .)
    scalar fcontents = subinstr(fcontents, "label values line label_line", "// label values line label_line", .)
	scalar byteswritten = filewrite("EF`yindex'a.do", fcontents, 1)
	 // File name convetions not consistent through the years.
    // 2007, 2008, 2010-2015 provide _rv_ editions of the data.
    //
    if (`yindex' > 2006 & `yindex' < 2009) | (`yindex' > 2009 & `yindex' < 2016) {
        import delimited ef`yindex'a_rv_data_stata.csv, clear
	}
    else {
        import delimited ef`yindex'a_data_stata.csv, clear
	}

	//Reshape
	//Question: where should reshape go in code?
	//			which variables should be kept?
	//			how to keep efalevel Adam requested?
	//	********variables are not consistent throughout the years, will have to rename. 
	keep unitid efalevel line section lstudy ///
	eftotlt eftotlm eftotlw efaiant efaianm efaianw efasiat efasiam ///
	efasiaw efbkaat efbkaam efbkaaw efhispt efhispm efhispw efnhpit ///
	efnhpim efnhpiw efwhitt efwhitm efwhitw ef2mort ef2morm ef2morw ///
	efunknt efunknm efunknw efnralt efnralm efnralw dvefait dvefaim ///
	//dvefaiw dvefapt dvefapm dvefapw dvefbkt dvefbkm dvefbkw dvefhst /// do we need imputation variables?
	//dvefhsm dvefhsw dvefwht dvefwhm dvefwhw efrace19 efrace05 efrace06 ///
	efrace20 efrace07 efrace08 efrace18 efrace03 efrace04 efrace21 efrace09 ///
	efrace10 efrace22 efrace11 efrace12 efrace01 efrace02 efrace13 efrace14 ///
	efrace15 efrace16 efrace17 efrace23 efrace24  ///

	keep if efalevel == 1, 2, 11, 12, 21, 22, 32, 41, 42, 52
	keep unitid efalevel eftotlt eftotlm eftotlw efaiant efaianm efaianw efasiat efasiam ///
	efasiaw efbkaat efbkaam efbkaaw efhispt efhispm efhispw efnhpit ///
	efnhpim efnhpiw efwhitt efwhitm efwhitw ef2mort ef2morm ef2morw ///
	efunknt efunknm efunknw efnralt efnralm efnralw dvefait dvefaim ///
	//dvefaiw dvefapt dvefapm dvefapw dvefbkt dvefbkm dvefbkw dvefhst ///
	//dvefhsm dvefhsw dvefwht dvefwhm dvefwhw efrace19 efrace05 efrace06 ///
	efrace20 efrace07 efrace08 efrace18 efrace03 efrace04 efrace21 efrace09 ///
	efrace10 efrace22 efrace11 efrace12 efrace01 efrace02 efrace13 efrace14 ///
	efrace15 efrace16 efrace17 efrace23 efrace24  

	reshape wide 
	eftotlt eftotlm eftotlw efaiant efaianm efaianw efasiat efasiam ///
	efasiaw efbkaat efbkaam efbkaaw efhispt efhispm efhispw efnhpit ///
	efnhpim efnhpiw efwhitt efwhitm efwhitw ef2mort ef2morm ef2morw ///
	efunknt efunknm efunknw efnralt efnralm efnralw dvefait dvefaim ///
	//dvefaiw dvefapt dvefapm dvefapw dvefbkt dvefbkm dvefbkw dvefhst ///
	//dvefhsm dvefhsw dvefwht dvefwhm dvefwhw efrace19 efrace05 efrace06 ///
	efrace20 efrace07 efrace08 efrace18 efrace03 efrace04 efrace21 efrace09 ///
	efrace10 efrace22 efrace11 efrace12 efrace01 efrace02 efrace13 efrace14 ///
	efrace15 efrace16 efrace17 efrace23 efrace24, i(unitid) j(efalevel) 
	
	di "QUIET RUN OF EF`yindex'a.do"       //Provides user with informaiton for log file
	qui do EF`yindex'a                     //Quietly run NCES provided do files. 
	di `sp'                                //Spacing to assist reading output.
	
	//Add isYr index and order new variable. 
	gen int isYr = `yindex'
	order isYr, after (unitid)
	
	saveold "ef`yindex'a_data_stata.dta", version(13) replace   // Save cleaned data file.
		di `sp'	`sp'                                            // Spacer for the output.
}

use ef2016a_data_stata.dta, clear
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"                                          // Output for log file.
	append using "ef`yindex'a_data_stata.dta", force
	di `sp'                                                     // Spacing for log file.
}  
cd ..
compress

label data "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll/tree/master"
notes _dta: "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll/tree/master"
notes _dta: "Panel built on `c(current_date)'"
saveold "$dtagbl", replace version(13)


//Beginning of B Series
cd $wkdgbl                                            // Change back to working directory.
forvalues yindex = 2002 / 2016 {
	//Copy, unzip, and import data files.
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Data_Stata.zip .
	unzipfile EF`yindex'B_Data_Stata.zip
	import delimited EF`yindex'B_Data_Stata.csv
	//Add isYr index and order new variable. 
	//gen int isYr = `yindex'
	//order isYr, after (unitid)

	//Download the NCES provided do file for B series 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Stata.zip .
	unzipfile EF`yindex'B_Stata.zip, replace 

	//Read do file into scalar for modification. 
	scalar fcontents = fileread("EF`yindex'B.do")
	
	//Remove default "insheet" command designed to import data. 
	//Remove default "save" command designed to save data. 
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	
	//Remove unexpected carriage returns and line feeds. 
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	
	//Save, rename, and run the revised and working do file. 
	scalar byteswritten = filewrite("EF`yindex'b.do", fcontents, 1)
	
	 // File name convetions not consistent through the years.
    // 2007-2015 provide _rv_ editions of the data.
    //
    if `yindex' > 2006 & `yindex' < 2016 {
        import delimited ef`yindex'b_rv_data_stata.csv, clear
	}
    else {
        import delimited ef`yindex'b_data_stata.csv, clear
	}
	
	
	di "QUIET RUN OF EF`yindex'b.do" 
	qui do EF`yindex'b
	di `sp'

	compress 
	saveold EF`yindex'B_data_stata.dta, replace version (13)
	di `sp'
	clear
}
	



use ef2016b_data_stata.dta, clear 
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"                                                  // Output for log file.
	append using "ef`yindex'b_data_stata.dta", force
	di `sp'	                                                            // Spacing for log file.
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
