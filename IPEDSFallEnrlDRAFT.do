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
	scalar fcontents = fileread("EF`yindex'A.do")
	
	//Remove default "insheet" command designed to import data. 
	//Remove defualt "save" command designed to save data.
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)

	//Remove unexpected carriage returns and line feeds. 
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	
	//Save, rename, and run the revised and working do file. 
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
	
	
// Start of B series coding 
forvalues yindex = 2002 / 2016 {
	//Copy, unzip, and import data files. 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Data_Stata.zip .
	unzipfile EF`yindex'B_Data_Stata.zip
	import delimited EF`yindex'B_Data_Stata.csv

	//Add isYr index and order new variable. 
	gen int isYr = `yindex'
	order isYr, after (unitid)

	//Download the NCES provided do file for B series 
	copy https://nces.ed.gov/ipeds/datacenter/data/EF`yindex'B_Stata.zip .
	unzipfile EF`yindex'B_Stata.zip, replace 

	//Read do file into scalar for modification. 
	scalar fcontents = fileread("EF`yindex'B.do")
	
	//Remove default "insheet" command designed to import data. 
	//Remove defualt "save" command designed to save data. 
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	
	//Remove unexpected carriage returns and line feeds. 
	scalar sstring = char(13) + char(10) + char(34)
	scalar fcontents = subinstr(fcontents, sstring, char(34), .)
	
	//Save, rename, and run the revised and working do file. 
	scalar byteswritten = filewrite("EF`yindex'b.do, fcontents, 1)
	di "QUIET RUN OF EF`yindex'b.do" 
	qui do EF`yindex'b
	di `sp'

	compress 
	saveold EF`yindex'B_data_stata.dta, replace version (13)
	di `sp'
	clear
}

	
use ef2016a_data_stata.dta, clear
	forvalues yindex = 2015(-1)2002 {
	display "`yindex'"                                       // Output for log file.
	append using "ef`yindex'a_data_stata.dta", force
	di `sp'                                                  // Spacing for log file.
}

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
