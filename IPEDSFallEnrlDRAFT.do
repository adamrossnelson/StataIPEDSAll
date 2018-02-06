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
