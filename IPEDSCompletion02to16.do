set more off 
clear all 
cls 

// Use this code to download, build, and save to the local computer
// data from the Directory Information survey at the US DOE's 
// Integrated Postsecondary Education Data System 

// Initial build: 			Fall 2017
// GitHub rebuild: 			October 2017
// Original author: 		Naiya Patel 

/*#############################################################################
 
	This do file is maintained by Naiya Patel and Adam Ross Nelson at
	https://github.com/Bucky1192/StataIPEDSAll
	
	Questions or comments via GitHub 
	
	Oct 31 2017 update uses a file picker routine found at: 
	https://raw.github

##############################################################################*/

// Utilizes preckage version of sshnd (interactive file picker)/
// Stable 1.0 version of sshnd documentation avilable at: 
// https://github.com/adamrossnelson/sshnd/tree/1.0
do https://raw.githubusercontent.com/adamrossnelson/sshnd/1.0/sshnd.do

capture log close 							// Close stray log files. 
log using "$loggbl", append					// Append sshnd established log file. 
local sp char(13) char(10) char(13) char(10)// Define spacer. 
version 13									// Enforce 
