set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the 12-MONTH INSTRUCTIONAL ACTIVITY survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.

// Jan/2018:	 Naiya Patel - Updated to include 2016 datafiles. 
// Oct/2017:     Naiya Patel - Merge with master branch.
// Oct/2017:     Naiya Patel - Original author, initial build.

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

// Loop designed to download zip files and NCES provided Stata do files.
// Stata do files need cleaning (remove stray char (13) + char(10) + char(34)).

forvalues fname= 2002/2016 {
  // Copy and unzip data and do files.
  copy https://nces.ed.gov/ipeds/datacenter/data/EFIA`fname'_Data_Stata.zip .
  unzipfile EFIA`fname'_Data_Stata.zip, replace
  if `fname' > 2006 & `fname' < 2016 {
    import delimited EFIA`fname'_rv_data_stata.csv, clear 
	}
  else { 
      import delimited EFIA`fname'_data_stata.csv, clear 
	}
  //Add isYr index and order the new variable. 
  gen int isYr = `fname'
  order isYr, after (unitid) 
  // Need to download do file from IPEDS data 
  copy https://nces.ed.gov/ipeds/datacenter/data/EFIA`fname'_Stata.zip .
  unzipfile EFIA`fname'_Stata.zip, replace 
  // Using scalar command
  // Remove "insheet" command designed to import data. 
  // Remove "save" command designed to save data. 

  scalar fcontents = fileread("efia`fname'.do")
  scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
  scalar fcontents = subinstr(fcontents, "save", "// save", .)

  // Save edited do file.
  scalar byteswritten = filewrite("efia`fname'.do", fcontents, 1)
  di "QUIET RUN OF efia`fname'.do"    //Provides the user information for log file. 
  qui do efia`fname'					//Quietly run do files
  di `sp'		

  compress
  saveold efia`fname'_data_stata.dta, replace version (13)
  di `sp'
  clear
}

    //Loop dta files to assemble panel data set. 
	
    use efia2016_data_stata.dta, clear 
    forvalues yindex = 2015(-1)2002 {
        display "`yindex'"
        append using "efia`yindex'_data_stata.dta", force 
        di `sp'
}

    // Move up file directory level, compress, add notes.
    // Save resulting panel data set.
	
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

