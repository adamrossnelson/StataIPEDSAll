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
	import delimited EF`yindex'A_Data_Stata.csv
	     //Add isYr index and order new variable. 
	gen int isYr = `yindex'
	order isYr, after (unitid)
	     //Download the NCES provided do file for A series 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'A_Stata.zip .
	unzipfile EF`yindex'A_Stata.zip, replace
	     //Read do file into scalar for modification. 
		 //Remove default "insheet" command designed to import data. 
		 //Remove defualt "save" command designed to save data.
		 
    scalar fcontents = fileread("EF`yindex'A.do")
    scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
    scalar fcontents = subinstr(fcontents, "save", "// save", .)
	     //Remove unexpected carriage returns and line feeds. 
    scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
         //Save and name the revised and working do file. 
    scalar byteswritten = filewrite("EF`yindex'a.do", fcontents, 1)
	di "QUIET RUN OF EF`yindex'a.do"       //Provides user with informaiton for log file
	qui do EF`yindex'a                     //Quietly run NCES provided do files. 
	di `sp'                                //Spacing to assist reading output. 
	
	     //Compress and save the resulting do file. 
	compress
	saveold EF`yindex'A_data_stata.dta, replace version (13)
	di `sp'                                //Spacing to assist reading output.
	clear 
	}
	
<<<<<<< HEAD
	/*
	// Start of B series coding 

	forvalues yindex = 2002 / 2016 {
         //Copy, unzip, and import data files. 
=======
	
<<<<<<< HEAD
// Start of B series coding 
forvalues yindex = 2002 / 2016 {
	//Copy, unzip, and import data files. 
>>>>>>> 0e97b0383f19f273392f2b10a13273f582ab6235
=======
	// Start of B series coding 

	forvalues yindex = 2002 / 2016 {
         //Copy, unzip, and import data files. 
>>>>>>> ca8cc71e06919827290c6a6e1448be416920dd8d
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Data_Stata.zip .
	unzipfile EF`yindex'B_Data_Stata.zip
	import delimited EF`yindex'B_Data_Stata.csv
	     //Add isYr index and order new variable. 
	gen int isYr = `yindex'
	order isYr, after (unitid)
	     //Read do file into scalar for modification. 
		 //Remove default "insheet" command designed to import data. 
		 //Remove defualt "save" command designed to save data. 
		 
    copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Stata.zip .
	unzipfile EF`yindex'B_Stata.zip, replace 
	scalar fcontents = fileread("EF`yindex'B.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	
	//Save edited do file 
	scalar byteswritten = filewrite ("EF`yindex'b.do, fcontents, 1)
	di "QUIET RUN OF EF`yindex'b.do" 
	qui do EF`yindex'b
	di `sp'
	
	compress 
	saveold EF`yindex'B_data_stata.dta, replace version (13)
	di `sp'
	clear
	}

<<<<<<< HEAD
	*/
	use ef2016a_data_stata.dta, clear
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"						// Output for log file.
=======
	
<<<<<<< HEAD
use ef2016a_data_stata.dta, clear
	forvalues yindex = 2015(-1)2002 {
	display "`yindex'"                                       // Output for log file.
>>>>>>> 0e97b0383f19f273392f2b10a13273f582ab6235
=======
	use ef2016a_data_stata.dta, clear
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"						// Output for log file.
>>>>>>> ca8cc71e06919827290c6a6e1448be416920dd8d
	append using "ef`yindex'a_data_stata.dta", force
	di `sp'									// Spacing for log file.
}

<<<<<<< HEAD
<<<<<<< HEAD
keep unitid efalevel line section lstudy

eftotlt eftotlm eftotlw efaiant efaianm efaianw efasiat efasiam ///
efasiaw efbkaat efbkaam efbkaaw efhispt efhispm efhispw efnhpit ///
efnhpim efnhpiw efwhitt efwhitm efwhitw ef2mort ef2morm ef2morw ///
efunknt efunknm efunknw efnralt efnralm efnralw dvefait dvefaim ///
dvefaiw dvefapt dvefapm dvefapw dvefbkt dvefbkm dvefbkw dvefhst ///
dvefhsm dvefhsw dvefwht dvefwhm dvefwhw efrace19 efrace05 efrace06 ///
efrace20 efrace07 efrace08 efrace18 efrace03 efrace04 efrace21 efrace09 ///
efrace10 efrace22 efrace11 efrace12 efrace01 efrace02 efrace13 efrace14 ///
efrace15 efrace16 efrace17 efrace23 efrace24  ///

// Reshape: potential reshape code 

keep unitid efalevel eftotlt eftotlm eftotlw efaiant efaianm efaianw efasiat efasiam ///
efasiaw efbkaat efbkaam efbkaaw efhispt efhispm efhispw efnhpit ///
efnhpim efnhpiw efwhitt efwhitm efwhitw ef2mort ef2morm ef2morw ///
efunknt efunknm efunknw efnralt efnralm efnralw dvefait dvefaim ///
dvefaiw dvefapt dvefapm dvefapw dvefbkt dvefbkm dvefbkw dvefhst ///
dvefhsm dvefhsw dvefwht dvefwhm dvefwhw efrace19 efrace05 efrace06 ///
efrace20 efrace07 efrace08 efrace18 efrace03 efrace04 efrace21 efrace09 ///
efrace10 efrace22 efrace11 efrace12 efrace01 efrace02 efrace13 efrace14 ///
efrace15 efrace16 efrace17 efrace23 efrace24

=======
>>>>>>> 0e97b0383f19f273392f2b10a13273f582ab6235
=======

>>>>>>> ca8cc71e06919827290c6a6e1448be416920dd8d
cd ..
drop x*
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
