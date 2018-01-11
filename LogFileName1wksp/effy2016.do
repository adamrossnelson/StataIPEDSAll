* Created      May 26, 2017                                
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
// insheet using "C:\DCT\effy2016_data_stata.csv", comma clear
label data "dct_s2015_is"
label variable unitid   "Unique identification number of the institution"
label variable effylev  "Level of student"
label variable lstudy   "Original level of study on survey form"
label variable xeytotlt "Imputation field for efytotlt - Grand total"
label variable efytotlt "Grand total"
label variable xeytotlm "Imputation field for efytotlm - Grand total men"
label variable efytotlm "Grand total men"
label variable xeytotlw "Imputation field for efytotlw - Grand total women"
label variable efytotlw "Grand total women"
label variable xefyaiat "Imputation field for efyaiant - American Indian or Alaska Native total"
label variable efyaiant "American Indian or Alaska Native total"
label variable xefyaiam "Imputation field for efyaianm - American Indian or Alaska Native men"
label variable efyaianm "American Indian or Alaska Native men"
label variable xefyaiaw "Imputation field for efyaianw - American Indian or Alaska Native women"
label variable efyaianw "American Indian or Alaska Native women"
label variable xefyasit "Imputation field for efyasiat - Asian total"
label variable efyasiat "Asian total"
label variable xefyasim "Imputation field for efyasiam - Asian men"
label variable efyasiam "Asian men"
label variable xefyasiw "Imputation field for efyasiaw - Asian women"
label variable efyasiaw "Asian women"
label variable xefybkat "Imputation field for efybkaat - Black or African American total"
label variable efybkaat "Black or African American total"
label variable xefybkam "Imputation field for efybkaam - Black or African American men"
label variable efybkaam "Black or African American men"
label variable xefybkaw "Imputation field for efybkaaw - Black or African American women"
label variable efybkaaw "Black or African American women"
label variable xefyhist "Imputation field for efyhispt - Hispanic or Latino total"
label variable efyhispt "Hispanic or Latino total"
label variable xefyhism "Imputation field for efyhispm - Hispanic or Latino men"
label variable efyhispm "Hispanic or Latino men"
label variable xefyhisw "Imputation field for efyhispw - Hispanic or Latino women"
label variable efyhispw "Hispanic or Latino women"
label variable xefynhpt "Imputation field for efynhpit - Native Hawaiian or Other Pacific Islander total"
label variable efynhpit "Native Hawaiian or Other Pacific Islander total"
label variable xefynhpm "Imputation field for efynhpim - Native Hawaiian or Other Pacific Islander men"
label variable efynhpim "Native Hawaiian or Other Pacific Islander men"
label variable xefynhpw "Imputation field for efynhpiw - Native Hawaiian or Other Pacific Islander women"
label variable efynhpiw "Native Hawaiian or Other Pacific Islander women"
label variable xefywhit "Imputation field for efywhitt - White total"
label variable efywhitt "White total"
label variable xefywhim "Imputation field for efywhitm - White men"
label variable efywhitm "White men"
label variable xefywhiw "Imputation field for efywhitw - White women"
label variable efywhitw "White women"
label variable xefy2mot "Imputation field for efy2mort - Two or more races total"
label variable efy2mort "Two or more races total"
label variable xefy2mom "Imputation field for efy2morm - Two or more races men"
label variable efy2morm "Two or more races men"
label variable xefy2mow "Imputation field for efy2morw - Two or more races women"
label variable efy2morw "Two or more races women"
label variable xeyunknt "Imputation field for efyunknt - Race/ethnicity unknown total"
label variable efyunknt "Race/ethnicity unknown total"
label variable xeyunknm "Imputation field for efyunknm - Race/ethnicity unknown men"
label variable efyunknm "Race/ethnicity unknown men"
label variable xeyunknw "Imputation field for efyunknw - Race/ethnicity unknown women"
label variable efyunknw "Race/ethnicity unknown women"
label variable xeynralt "Imputation field for efynralt - Nonresident alien total"
label variable efynralt "Nonresident alien total"
label variable xeynralm "Imputation field for efynralm - Nonresident alien men"
label variable efynralm "Nonresident alien men"
label variable xeynralw "Imputation field for efynralw - Nonresident alien women"
label variable efynralw "Nonresident alien women"
label define label_effylev 1 "All students total"
label define label_effylev 2 "Undergraduate",add
label define label_effylev 4 "Graduate",add
label values effylev label_effylev
label define label_lstudy 1 "Undergraduate"
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
tab xeytotlt
tab xeytotlm
tab xeytotlw
tab xefyaiat
tab xefyaiam
tab xefyaiaw
tab xefyasit
tab xefyasim
tab xefyasiw
tab xefybkat
tab xefybkam
tab xefybkaw
tab xefyhist
tab xefyhism
tab xefyhisw
tab xefynhpt
tab xefynhpm
tab xefynhpw
tab xefywhit
tab xefywhim
tab xefywhiw
tab xefy2mot
tab xefy2mom
tab xefy2mow
tab xeyunknt
tab xeyunknm
tab xeyunknw
tab xeynralt
tab xeynralm
tab xeynralw
summarize efytotlt
summarize efytotlm
summarize efytotlw
summarize efyaiant
summarize efyaianm
summarize efyaianw
summarize efyasiat
summarize efyasiam
summarize efyasiaw
summarize efybkaat
summarize efybkaam
summarize efybkaaw
summarize efyhispt
summarize efyhispm
summarize efyhispw
summarize efynhpit
summarize efynhpim
summarize efynhpiw
summarize efywhitt
summarize efywhitm
summarize efywhitw
summarize efy2mort
summarize efy2morm
summarize efy2morw
summarize efyunknt
summarize efyunknm
summarize efyunknw
summarize efynralt
summarize efynralm
summarize efynralw
 // save dct_s2015_is
