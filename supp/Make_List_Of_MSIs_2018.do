// Get IPEDS Directory Information
// Filter list to include MSIs
// Write to csv.
// https://twitter.com/JuliePosselt/status/1205602182516469760
//
// By: Adam Ross Nelson JD PhD
//     https://github.com/adamrossnelson
//     @AdamRossNelson
//     MIT License (See Below)

// PRELIMINARY WORK:    =======================================================
// Clear the workspace
set more off
clear all

// Set the workspace
cd ~\Documents                                          // Move to home dir
capture mkdir IPEDS_MSI_Wkspc                           // Make workspace
cd IPEDS_MSI_Wkspc                                      // Move to workspace

// ============================================================================
// PART ONE:    Get IPEDS Directory Information &  Do File ====================
copy https://nces.ed.gov/ipeds/datacenter/data/HD2018_Data_Stata.zip .
unzipfile HD2018_Data_Stata.zip, replace
import delimited hd2018_data_stata.csv, clear
gen int SurveyYr = 2018
order SurveyYr, after(unitid)

// Get and adjust NCES provided do file.
copy https://nces.ed.gov/ipeds/datacenter/data/HD2018_Stata.zip .
unzipfile HD2018_Stata.zip
scalar fcontents = fileread("hd2018.do")
scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
scalar fcontents = subinstr(fcontents, "save", "// save", .)
scalar sstring = char(13) + char(10) + char(34)
scalar fcontents = subinstr(fcontents, sstring, char(34), .)	
scalar byteswritten = filewrite("hd2018.do", fcontents, 1)
qui do hd2018.do                                        // Run NCES provided do

saveold hd2018_data_stata.dta, replace version(13)
clear all

// ============================================================================
// PART TWO:    Get IPEDS Fall Enrollment & Do File ===========================
copy https://nces.ed.gov/ipeds/datacenter/data/EF2018A_Data_Stata.zip .
unzipfile EF2018A_Data_Stata.zip, replace
import delimited ef2018a_data_stata.csv, clear
gen int SurveyYr = 2018
order SurveyYr, after(unitid)

// Download the NCES provided do file for B series 
copy https://nces.ed.gov/ipeds/datacenter/data/EF2018A_Stata.zip .
unzipfile EF2018A_Stata.zip, replace 
scalar fcontents = fileread("ef2018a.do")
scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
scalar fcontents = subinstr(fcontents, "save", "// save", .)
scalar sstring = char(13) + char(10) + char(34)
scalar fcontents = subinstr(fcontents, sstring, char(34), .)
scalar byteswritten = filewrite("EF2018a.do", fcontents, 1)
qui do EF2018a.do                                       // Run NCES provided do

// Establish local for varlist.
local thevars efnralm efnralw efbkaam efbkaaw efaianm efaianw ///
efasiam efasiaw efhispm efhispw efwhitm efwhitw efunknm efunknw ///
eftotlm eftotlw efnralt efbkaat efaiant efasiat efhispt efwhitt ///
efunknt eftotlt ef2mort ef2morm ef2morw efnhpit efnhpim efnhpiw
// Loop to save variable label names for reapplication after reshape.
foreach varname in `thevars' {
	local l`varname' : variable label `varname' 
}
// Simplify dataset
keep unitid efalevel `thevars'
keep if inlist(efalevel, 1, 2, 12, 21, 22, 32, 41, 42, 52)
levelsof efalevel, local(levels)
// Get the value lable name associated with var efalevel
local lbe : value label efalevel
// Get individual value labels from valuelabel associated with var efalevel
foreach l of local levels {
	local ms_`l' : label `lbe' `l'
	local ms_`l' = subinstr("`ms_`l''","student","stdt",.)
	local ms_`l' = subinstr("`ms_`l''","Undergraduate","Ugrd",.)
	local ms_`l' = subinstr("`ms_`l''","Graduate","Grad",.)
	local ms_`l' = subinstr("`ms_`l''","total","Tot",.)
	local ms_`l' = subinstr("`ms_`l''","Full-time","Fltime",.)
	local ms_`l' = subinstr("`ms_`l''","Part-time","Pttime",.)
}
// Reshape
reshape wide `thevars', i(unitid) j(efalevel) 
// Reapply variable label names following reshape.
foreach lev of local levels {
	foreach varname in `thevars' {
		label variable `varname'`lev' "`ms_`lev'' `l`varname''"
	}
}

saveold ef2018A_Data_Stata.dta, replace version(13)
clear all

// ============================================================================
// PART Three:    Clean Compile & Export Data =================================

use hd2018_data_stata.dta
merge 1:1 unitid using ef2018A_Data_Stata.dta
numlabel, add

gen pct_white = (efwhitt1 / eftotlt1) * 100
gsort pct_white

keep unitid SurveyYr instnm addr city stabbr sector hbcu tribal instsize ///
eftotlt1 efaiant1 efasiat1 efbkaat1 efhispt1 efnhpit1 efwhitt1 ef2mort1 ///
efunknt1 efnralt1 pct_white

gen msi = pct_white < .5
replace msi = 1 if hbcu == 1 | tribal == 1
label define pcnt_wt 0 "Not MSI" 1 "Is MSI"
label values msi pcnt_wt
order msi pct_white, after(sector)

gsort -msi hbcu tribal

saveold list_of_institutions_with_msi_indicator.dta, replace version(13)
export delimited using "list_of_mis_institutions.csv" if msi == 1, replace

/*
Copyright 2019 Adam Ross Nelson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE. */
