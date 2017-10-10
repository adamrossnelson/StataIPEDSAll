set more off
clear all
cls 

// Use this code to download, build, and save to the local computer
// data from the Institutional Characteristics survey at the US DOE's
// Integrated Postsecondary Education Data Stystem.

// Initial build: 			Fall 2017
// GitHub rebuild:			October 2017
// Original Author:			Naiya Patel 

/*#############################################################################

      This do file is maintained by Adam Ross Nelson JD PhD at
	  https://github.com/Bucky1192/StataIPEDSAll
	  
	  Questions or comments via GitHub 
	  
	  Oct 4 2017 update uses a file picker routine found at:
	  https://raw.githubusercontent.com/adamrossnelson/sshnd/1.0/sshnd.do
	  
##############################################################################*/

// Utilizes preckage version of sshnd (interactive file picker)/
// Stable 1.0 version of sshnd documentation available at:
// https://github.com/adamrossnelson/sshnd/tree/1.0
do https://raw.githubusercontent.com/adamrossnelson/sshnd/1.0/sshnd.do

capture log close							// Close stray log files.
log using "$loggbl", append					// Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)// Define spacer.
version 13									// Enforce version compatibility.
di c(pwd)									// Confrim working directory.

// This is a proposed edit.
gen yyy = _n
drop yyy

// Loop designed to download zip files and NCES provided Stata do files.
// Stata do files need cleaning (remove stray char(13) + char(10) + char(34)).

forvalues fname = 2014/2015 {
		// Copy and unzip data and do files.
		
	copy https://nces.ed.gov/ipeds/datacenter/data/EFIA`fname'_Data_Stata.zip . 
	unzipfile EFIA`fname'_Data_Stata.zip, replace
	import delimited EFIA`fname'_data_stata.csv, clear
	/*
	//Add isYr index and order the new variable. 
	gen int isYr = `fname'
	order isYr, after (unitid) 
	
	 // Need do file from NCES
	
	// Ask Adam to go over scalar	
	scalar fcontents = fileread("adm`fname'.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)
	
		// Save edited do file.
	scalar byteswritten = filewrite("adm`fname'.do", fcontents, 1)
	di `sp'								// Spacing to assist reading output. */
}

****/ Ask Adam Will be preparing Institutional Char. from 2002-2016
****/ thus will need to do the following 15 times 
// Prepare the Admissions and Test Scores 2014 file.
