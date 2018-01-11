* Created    April 25, 2017                                
*
* Modify the path below to point to your data file.
* The specified subdirectory was not created on
* your computer. You will need to do this.
*
* The stat program must be run against the specified
* data file. This file is specified in the program
* and must be // saved separately.
*
* This program does not provide tab or summarize for all
* variables.
*
* There may be missing data for some institutions due
* to the merge used to create this file.
*
* This program does not include reserved values in its
* calculations for missing values.
*
* You may need to adjust your memory settings depending
* upon the number of variables and records.
*
* The // save command may need to be modified per user
* requirements.
*
* For long lists of value labels, the titles may be
* shortened per program requirements.
*
// insheet using "c:\dct\effy2007_data_stata.csv", comma clear
label data "dct_effy2007"
label variable unitid   "Unique identification number of the institution"
label variable effylev  "Level of student"
label variable lstudy   "Original level of study on survey form"
label variable xfyrac01 "Imputation field for fyrace01 - Nonresident alien men"
label variable fyrace01 "Nonresident alien men"
label variable xfyrac02 "Imputation field for fyrace02 - Nonresident alien women"
label variable fyrace02 "Nonresident alien women"
label variable xfyrac03 "Imputation field for fyrace03 - Black non-Hispanic men"
label variable fyrace03 "Black non-Hispanic men"
label variable xfyrac04 "Imputation field for fyrace04 - Black non-Hispanic women"
label variable fyrace04 "Black non-Hispanic women"
label variable xfyrac05 "Imputation field for fyrace05 - American Indian or Alaska Native men"
label variable fyrace05 "American Indian or Alaska Native men"
label variable xfyrac06 "Imputation field for fyrace06 - American Indian or Alaska Native women"
label variable fyrace06 "American Indian or Alaska Native women"
label variable xfyrac07 "Imputation field for fyrace07 - Asian or Pacific Islander men"
label variable fyrace07 "Asian or Pacific Islander men"
label variable xfyrac08 "Imputation field for fyrace08 - Asian or Pacific Islander women"
label variable fyrace08 "Asian or Pacific Islander women"
label variable xfyrac09 "Imputation field for fyrace09 - Hispanic men"
label variable fyrace09 "Hispanic men"
label variable xfyrac10 "Imputation field for fyrace10 - Hispanic women"
label variable fyrace10 "Hispanic women"
label variable xfyrac11 "Imputation field for fyrace11 - White non-Hispanic men"
label variable fyrace11 "White non-Hispanic men"
label variable xfyrac12 "Imputation field for fyrace12 - White non-Hispanic women"
label variable fyrace12 "White non-Hispanic women"
label variable xfyrac13 "Imputation field for fyrace13 - Race/ethnicity unknown men"
label variable fyrace13 "Race/ethnicity unknown men"
label variable xfyrac14 "Imputation field for fyrace14 - Race/ethnicity unknown women"
label variable fyrace14 "Race/ethnicity unknown women"
label variable xfyrac15 "Imputation field for fyrace15 - Grand total men"
label variable fyrace15 "Grand total men"
label variable xfyrac16 "Imputation field for fyrace16 - Grand total women"
label variable fyrace16 "Grand total women"
label variable xfyrac17 "Imputation field for fyrace17 - Nonresident alien total"
label variable fyrace17 "Nonresident alien total"
label variable xfyrac18 "Imputation field for fyrace18 - Black non-Hispanic  total"
label variable fyrace18 "Black non-Hispanic  total"
label variable xfyrac19 "Imputation field for fyrace19 - American Indian or Alaska Native total"
label variable fyrace19 "American Indian or Alaska Native total"
label variable xfyrac20 "Imputation field for fyrace20 - Asian or Pacific Islander total"
label variable fyrace20 "Asian or Pacific Islander total"
label variable xfyrac21 "Imputation field for fyrace21 - Hispanic total"
label variable fyrace21 "Hispanic total"
label variable xfyrac22 "Imputation field for fyrace22 - White non-Hispanic total"
label variable fyrace22 "White non-Hispanic total"
label variable xfyrac23 "Imputation field for fyrace23 - Race/ethnicity unknown total"
label variable fyrace23 "Race/ethnicity unknown total"
label variable xfyrac24 "Imputation field for fyrace24 - Grand total"
label variable fyrace24 "Grand total"
label define label_effylev 1 "All students total"
label define label_effylev 2 "Undergraduate",add
label define label_effylev 3 "First professional",add
label define label_effylev 4 "Graduate",add
label values effylev label_effylev
label define label_lstudy 1 "Undergraduate"
label define label_lstudy 2 "First professional",add
label define label_lstudy 3 "Graduate",add
label define label_lstudy 999 "Generated total",add
label values lstudy label_lstudy
*The following are the possible values for the item imputation field variables
*A Not applicable
*B Institution left item blank
*C Analyst corrected reported value
*D Do not know
*G Data generated from other data values
*H Value not derived - data not usable
*J Logical imputation
*K Ratio adjustment
*L Imputed using the Group Median procedure
*N Imputed using Nearest Neighbor procedure
*P Imputed using Carry Forward procedure
*R Reported
*Z Implied zero
tab effylev
tab lstudy
tab xfyrac01
tab xfyrac02
tab xfyrac03
tab xfyrac04
tab xfyrac05
tab xfyrac06
tab xfyrac07
tab xfyrac08
tab xfyrac09
tab xfyrac10
tab xfyrac11
tab xfyrac12
tab xfyrac13
tab xfyrac14
tab xfyrac15
tab xfyrac16
tab xfyrac17
tab xfyrac18
tab xfyrac19
tab xfyrac20
tab xfyrac21
tab xfyrac22
tab xfyrac23
tab xfyrac24
summarize fyrace01
summarize fyrace02
summarize fyrace03
summarize fyrace04
summarize fyrace05
summarize fyrace06
summarize fyrace07
summarize fyrace08
summarize fyrace09
summarize fyrace10
summarize fyrace11
summarize fyrace12
summarize fyrace13
summarize fyrace14
summarize fyrace15
summarize fyrace16
summarize fyrace17
summarize fyrace18
summarize fyrace19
summarize fyrace20
summarize fyrace21
summarize fyrace22
summarize fyrace23
summarize fyrace24
 // save dct_effy2007
