* Created  October 29, 2015                                
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
// insheet using "C:\DCT\2008\effy2008_data_stata.csv", comma clear
label data "dct_effy2008"
label variable unitid   "Unique identification number of the institution"
label variable effylev  "Level of student"
label variable lstudy   "Original level of study on survey form"
label variable xeynralm "Imputation field for efynralm - Nonresident alien men"
label variable efynralm "Nonresident alien men"
label variable xeynralw "Imputation field for efynralw - Nonresident alien women"
label variable efynralw "Nonresident alien women"
label variable xfyrac03 "Imputation field for fyrace03 - Black non-Hispanic men - old"
label variable fyrace03 "Black non-Hispanic men - old"
label variable xfyrac04 "Imputation field for fyrace04 - Black non-Hispanic women - old"
label variable fyrace04 "Black non-Hispanic women - old"
label variable xfyrac05 "Imputation field for fyrace05 - American Indian or Alaska Native men - old"
label variable fyrace05 "American Indian or Alaska Native men - old"
label variable xfyrac06 "Imputation field for fyrace06 - American Indian or Alaska Native women - old"
label variable fyrace06 "American Indian or Alaska Native women - old"
label variable xfyrac07 "Imputation field for fyrace07 - Asian or Pacific Islander men - old"
label variable fyrace07 "Asian or Pacific Islander men - old"
label variable xfyrac08 "Imputation field for fyrace08 - Asian or Pacific Islander women - old"
label variable fyrace08 "Asian or Pacific Islander women - old"
label variable xfyrac09 "Imputation field for fyrace09 - Hispanic men - old"
label variable fyrace09 "Hispanic men - old"
label variable xfyrac10 "Imputation field for fyrace10 - Hispanic women - old"
label variable fyrace10 "Hispanic women - old"
label variable xfyrac11 "Imputation field for fyrace11 - White non-Hispanic men - old"
label variable fyrace11 "White non-Hispanic men - old"
label variable xfyrac12 "Imputation field for fyrace12 - White non-Hispanic women - old"
label variable fyrace12 "White non-Hispanic women - old"
label variable xeyunknm "Imputation field for efyunknm - Race/ethnicity unknown men"
label variable efyunknm "Race/ethnicity unknown men"
label variable xeyunknw "Imputation field for efyunknw - Race/ethnicity unknown women"
label variable efyunknw "Race/ethnicity unknown women"
label variable xeytotlm "Imputation field for efytotlm - Grand total men"
label variable efytotlm "Grand total men"
label variable xeytotlw "Imputation field for efytotlw - Grand total women"
label variable efytotlw "Grand total women"
label variable xeynralt "Imputation field for efynralt - Nonresident alien total"
label variable efynralt "Nonresident alien total"
label variable xfyrac18 "Imputation field for fyrace18 - Black non-Hispanic  total - old"
label variable fyrace18 "Black non-Hispanic  total - old"
label variable xfyrac19 "Imputation field for fyrace19 - American Indian or Alaska Native total - old"
label variable fyrace19 "American Indian or Alaska Native total - old"
label variable xfyrac20 "Imputation field for fyrace20 - Asian or Pacific Islander total - old"
label variable fyrace20 "Asian or Pacific Islander total - old"
label variable xfyrac21 "Imputation field for fyrace21 - Hispanic total - old"
label variable fyrace21 "Hispanic total - old"
label variable xfyrac22 "Imputation field for fyrace22 - White non-Hispanic total - old"
label variable fyrace22 "White non-Hispanic total - old"
label variable xeyunknt "Imputation field for efyunknt - Race/ethnicity unknown total"
label variable efyunknt "Race/ethnicity unknown total"
label variable xeytotlt "Imputation field for efytotlt - Grand total"
label variable efytotlt "Grand total"
label variable xefyhism "Imputation field for efyhispm - Hispanic men - new"
label variable efyhispm "Hispanic men - new"
label variable xefyhisw "Imputation field for efyhispw - Hispanic women - new"
label variable efyhispw "Hispanic women - new"
label variable xefyaiam "Imputation field for efyaianm - American Indian or Alaska Native men - new"
label variable efyaianm "American Indian or Alaska Native men - new"
label variable xefyaiaw "Imputation field for efyaianw - American Indian or Alaska Native women - new"
label variable efyaianw "American Indian or Alaska Native women - new"
label variable xefyasim "Imputation field for efyasiam - Asian men - new"
label variable efyasiam "Asian men - new"
label variable xefyasiw "Imputation field for efyasiaw - Asian women - new"
label variable efyasiaw "Asian women - new"
label variable xefybkam "Imputation field for efybkaam - Black or African American men - new"
label variable efybkaam "Black or African American men - new"
label variable xefybkaw "Imputation field for efybkaaw - Black or African American women - new"
label variable efybkaaw "Black or African American women - new"
label variable xefynhpm "Imputation field for efynhpim - Native Hawaiian or Other Pacific Islander men - new"
label variable efynhpim "Native Hawaiian or Other Pacific Islander men - new"
label variable xefynhpw "Imputation field for efynhpiw - Native Hawaiian or Other Pacific Islander women - new"
label variable efynhpiw "Native Hawaiian or Other Pacific Islander women - new"
label variable xefywhim "Imputation field for efywhitm - White men - new"
label variable efywhitm "White men - new"
label variable xefywhiw "Imputation field for efywhitw - White women - new"
label variable efywhitw "White women - new"
label variable xefy2mom "Imputation field for efy2morm - Two or more races men - new"
label variable efy2morm "Two or more races men - new"
label variable xefy2mow "Imputation field for efy2morw - Two or more races women - new"
label variable efy2morw "Two or more races women - new"
label variable xefyhist "Imputation field for efyhispt - Hispanic total - new"
label variable efyhispt "Hispanic total - new"
label variable xefyaiat "Imputation field for efyaiant - American Indian or Alaska Native total - new"
label variable efyaiant "American Indian or Alaska Native total - new"
label variable xefyasit "Imputation field for efyasiat - Asian total - new"
label variable efyasiat "Asian total - new"
label variable xefybkat "Imputation field for efybkaat - Black or African American total - new"
label variable efybkaat "Black or African American total - new"
label variable xefynhpt "Imputation field for efynhpit - Native Hawaiian or Other Pacific Islander total - new"
label variable efynhpit "Native Hawaiian or Other Pacific Islander total - new"
label variable xefywhit "Imputation field for efywhitt - White total - new"
label variable efywhitt "White total - new"
label variable xefy2mot "Imputation field for efy2mort - Two or more races total - new"
label variable efy2mort "Two or more races total - new"
label variable xdveyait "Imputation field for dveyait - American Indian or Alaska Native total - derived"
label variable dveyait  "American Indian or Alaska Native total - derived"
label variable xdveyaim "Imputation field for dveyaim - American Indian or Alaska Native men - derived"
label variable dveyaim  "American Indian or Alaska Native men - derived"
label variable xdveyaiw "Imputation field for dveyaiw - American Indian or Alaska Native women - derived"
label variable dveyaiw  "American Indian or Alaska Native women - derived"
label variable xdveyapt "Imputation field for dveyapt - Asian/Native Hawaiian/Other Pacific Islander total - derived"
label variable dveyapt  "Asian/Native Hawaiian/Other Pacific Islander total - derived"
label variable xdveyapm "Imputation field for dveyapm - Asian/Native Hawaiian/Other Pacific Islander men - derived"
label variable dveyapm  "Asian/Native Hawaiian/Other Pacific Islander men - derived"
label variable xdveyapw "Imputation field for dveyapw - Asian/Native Hawaiian/Other Pacific Islander women - derived"
label variable dveyapw  "Asian/Native Hawaiian/Other Pacific Islander women - derived"
label variable xdveybkt "Imputation field for dveybkt - Black or African American/Black non-Hispanic total - derived"
label variable dveybkt  "Black or African American/Black non-Hispanic total - derived"
label variable xdveybkm "Imputation field for dveybkm - Black or African American/Black non-Hispanic men - derived"
label variable dveybkm  "Black or African American/Black non-Hispanic men - derived"
label variable xdveybkw "Imputation field for dveybkw - Black or African American/Black non-Hispanic women - derived"
label variable dveybkw  "Black or African American/Black non-Hispanic women - derived"
label variable xdveyhst "Imputation field for dveyhst - Hispanic or Latino/Hispanic  total - derived"
label variable dveyhst  "Hispanic or Latino/Hispanic  total - derived"
label variable xdveyhsm "Imputation field for dveyhsm - Hispanic or Latino/Hispanic  men - derived"
label variable dveyhsm  "Hispanic or Latino/Hispanic  men - derived"
label variable xdveyhsw "Imputation field for dveyhsw - Hispanic or Latino/Hispanic  women - derived"
label variable dveyhsw  "Hispanic or Latino/Hispanic  women - derived"
label variable xdveywht "Imputation field for dveywht - White/White non-Hispanic total - derived"
label variable dveywht  "White/White non-Hispanic total - derived"
label variable xdveywhm "Imputation field for dveywhm - White/White non-Hispanic men - derived"
label variable dveywhm  "White/White non-Hispanic men - derived"
label variable xdveywhw "Imputation field for dveywhw - White/White non-Hispanic women - derived"
label variable dveywhw  "White/White non-Hispanic women - derived"
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
tab xeynralm
tab xeynralw
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
tab xeyunknm
tab xeyunknw
tab xeytotlm
tab xeytotlw
tab xeynralt
tab xfyrac18
tab xfyrac19
tab xfyrac20
tab xfyrac21
tab xfyrac22
tab xeyunknt
tab xeytotlt
tab xefyhism
tab xefyhisw
tab xefyaiam
tab xefyaiaw
tab xefyasim
tab xefyasiw
tab xefybkam
tab xefybkaw
tab xefynhpm
tab xefynhpw
tab xefywhim
tab xefywhiw
tab xefy2mom
tab xefy2mow
tab xefyhist
tab xefyaiat
tab xefyasit
tab xefybkat
tab xefynhpt
tab xefywhit
tab xefy2mot
tab xdveyait
tab xdveyaim
tab xdveyaiw
tab xdveyapt
tab xdveyapm
tab xdveyapw
tab xdveybkt
tab xdveybkm
tab xdveybkw
tab xdveyhst
tab xdveyhsm
tab xdveyhsw
tab xdveywht
tab xdveywhm
tab xdveywhw
summarize efynralm
summarize efynralw
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
summarize efyunknm
summarize efyunknw
summarize efytotlm
summarize efytotlw
summarize efynralt
summarize fyrace18
summarize fyrace19
summarize fyrace20
summarize fyrace21
summarize fyrace22
summarize efyunknt
summarize efytotlt
summarize efyhispm
summarize efyhispw
summarize efyaianm
summarize efyaianw
summarize efyasiam
summarize efyasiaw
summarize efybkaam
summarize efybkaaw
summarize efynhpim
summarize efynhpiw
summarize efywhitm
summarize efywhitw
summarize efy2morm
summarize efy2morw
summarize efyhispt
summarize efyaiant
summarize efyasiat
summarize efybkaat
summarize efynhpit
summarize efywhitt
summarize efy2mort
summarize dveyait
summarize dveyaim
summarize dveyaiw
summarize dveyapt
summarize dveyapm
summarize dveyapw
summarize dveybkt
summarize dveybkm
summarize dveybkw
summarize dveyhst
summarize dveyhsm
summarize dveyhsw
summarize dveywht
summarize dveywhm
summarize dveywhw
 // save dct_effy2008
