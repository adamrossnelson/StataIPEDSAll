* Created September 3, 2015                                
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
// insheet using "c:\dct\adm2014_data_stata.csv", comma clear
label data "dct_adm2014"
label variable unitid   "Unique identification number of the institution"
label variable admcon1  "Secondary school GPA"
label variable admcon2  "Secondary school rank"
label variable admcon3  "Secondary school record"
label variable admcon4  "Completion of college-preparatory program"
label variable admcon5  "Recommendations"
label variable admcon6  "Formal demonstration of competencies"
label variable admcon7  "Admission test scores"
label variable admcon8  "TOEFL (Test of English as a Foreign Language"
label variable admcon9  "Other Test (Wonderlic, WISC-III, etc.)"
label variable xapplcn "Imputation field for applcn - Applicants total"
label variable applcn   "Applicants total"
label variable xapplcnm "Imputation field for applcnm - Applicants men"
label variable applcnm  "Applicants men"
label variable xapplcnw "Imputation field for applcnw - Applicants women"
label variable applcnw  "Applicants women"
label variable xadmssn "Imputation field for admssn - Admissions total"
label variable admssn   "Admissions total"
label variable xadmssnm "Imputation field for admssnm - Admissions men"
label variable admssnm  "Admissions men"
label variable xadmssnw "Imputation field for admssnw - Admissions women"
label variable admssnw  "Admissions women"
label variable xenrlt "Imputation field for enrlt - Enrolled total"
label variable enrlt    "Enrolled total"
label variable xenrlm "Imputation field for enrlm - Enrolled  men"
label variable enrlm    "Enrolled  men"
label variable xenrlw "Imputation field for enrlw - Enrolled  women"
label variable enrlw    "Enrolled  women"
label variable xenrlft "Imputation field for enrlft - Enrolled full time total"
label variable enrlft   "Enrolled full time total"
label variable xenrlftm "Imputation field for enrlftm - Enrolled full time men"
label variable enrlftm  "Enrolled full time men"
label variable xenrlftw "Imputation field for enrlftw - Enrolled full time women"
label variable enrlftw  "Enrolled full time women"
label variable xenrlpt "Imputation field for enrlpt - Enrolled part time total"
label variable enrlpt   "Enrolled part time total"
label variable xenrlptm "Imputation field for enrlptm - Enrolled part time men"
label variable enrlptm  "Enrolled part time men"
label variable xenrlptw "Imputation field for enrlptw - Enrolled part time women"
label variable enrlptw  "Enrolled part time women"
label variable xsatnum "Imputation field for satnum - Number of first-time degree/certificate-seeking students submitting SAT scores"
label variable satnum   "Number of first-time degree/certificate-seeking students submitting SAT scores"
label variable xsatpct "Imputation field for satpct - Percent of first-time degree/certificate-seeking students submitting SAT scores"
label variable satpct   "Percent of first-time degree/certificate-seeking students submitting SAT scores"
label variable xactnum "Imputation field for actnum - Number of first-time degree/certificate-seeking students submitting ACT scores"
label variable actnum   "Number of first-time degree/certificate-seeking students submitting ACT scores"
label variable xactpct "Imputation field for actpct - Percent of first-time degree/certificate-seeking students submitting ACT scores"
label variable actpct   "Percent of first-time degree/certificate-seeking students submitting ACT scores"
label variable xsatvr25 "Imputation field for satvr25 - SAT Critical Reading 25th percentile score"
label variable satvr25  "SAT Critical Reading 25th percentile score"
label variable xsatvr75 "Imputation field for satvr75 - SAT Critical Reading 75th percentile score"
label variable satvr75  "SAT Critical Reading 75th percentile score"
label variable xsatmt25 "Imputation field for satmt25 - SAT Math 25th percentile score"
label variable satmt25  "SAT Math 25th percentile score"
label variable xsatmt75 "Imputation field for satmt75 - SAT Math 75th percentile score"
label variable satmt75  "SAT Math 75th percentile score"
label variable xsatwr25 "Imputation field for satwr25 - SAT Writing 25th percentile score"
label variable satwr25  "SAT Writing 25th percentile score"
label variable xsatwr75 "Imputation field for satwr75 - SAT Writing 75th percentile score"
label variable satwr75  "SAT Writing 75th percentile score"
label variable xactcm25 "Imputation field for actcm25 - ACT Composite 25th percentile score"
label variable actcm25  "ACT Composite 25th percentile score"
label variable xactcm75 "Imputation field for actcm75 - ACT Composite 75th percentile score"
label variable actcm75  "ACT Composite 75th percentile score"
label variable xacten25 "Imputation field for acten25 - ACT English 25th percentile score"
label variable acten25  "ACT English 25th percentile score"
label variable xacten75 "Imputation field for acten75 - ACT English 75th percentile score"
label variable acten75  "ACT English 75th percentile score"
label variable xactmt25 "Imputation field for actmt25 - ACT Math 25th percentile score"
label variable actmt25  "ACT Math 25th percentile score"
label variable xactmt75 "Imputation field for actmt75 - ACT Math 75th percentile score"
label variable actmt75  "ACT Math 75th percentile score"
label variable xactwr25 "Imputation field for actwr25 - ACT Writing 25th percentile score"
label variable actwr25  "ACT Writing 25th percentile score"
label variable xactwr75 "Imputation field for actwr75 - ACT Writing 75th percentile score"
label variable actwr75  "ACT Writing 75th percentile score"
label define label_admcon1 1 "Required"
label define label_admcon1 2 "Recommended",add
label define label_admcon1 3 "Neither required nor recommended",add
label values admcon1 label_admcon1
label define label_admcon2 1 "Required"
label define label_admcon2 2 "Recommended",add
label define label_admcon2 3 "Neither required nor recommended",add
label define label_admcon2 4 "Do not know",add
label values admcon2 label_admcon2
label define label_admcon3 1 "Required"
label define label_admcon3 2 "Recommended",add
label define label_admcon3 3 "Neither required nor recommended",add
label values admcon3 label_admcon3
label define label_admcon4 1 "Required"
label define label_admcon4 2 "Recommended",add
label define label_admcon4 3 "Neither required nor recommended",add
label define label_admcon4 4 "Do not know",add
label values admcon4 label_admcon4
label define label_admcon5 1 "Required"
label define label_admcon5 2 "Recommended",add
label define label_admcon5 3 "Neither required nor recommended",add
label define label_admcon5 4 "Do not know",add
label values admcon5 label_admcon5
label define label_admcon6 1 "Required"
label define label_admcon6 2 "Recommended",add
label define label_admcon6 3 "Neither required nor recommended",add
label define label_admcon6 4 "Do not know",add
label values admcon6 label_admcon6
label define label_admcon7 1 "Required"
label define label_admcon7 2 "Recommended",add
label define label_admcon7 3 "Neither required nor recommended",add
label define label_admcon7 4 "Do not know",add
label values admcon7 label_admcon7
label define label_admcon8 1 "Required"
label define label_admcon8 2 "Recommended",add
label define label_admcon8 3 "Neither required nor recommended",add
label define label_admcon8 4 "Do not know",add
label values admcon8 label_admcon8
label define label_admcon9 1 "Required"
label define label_admcon9 2 "Recommended",add
label define label_admcon9 3 "Neither required nor recommended",add
label define label_admcon9 4 "Do not know",add
label values admcon9 label_admcon9
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
tab admcon1
tab admcon2
tab admcon3
tab admcon4
tab admcon5
tab admcon6
tab admcon7
tab admcon8
tab admcon9
tab xapplcn
tab xapplcnm
tab xapplcnw
tab xadmssn
tab xadmssnm
tab xadmssnw
tab xenrlt
tab xenrlm
tab xenrlw
tab xenrlft
tab xenrlftm
tab xenrlftw
tab xenrlpt
tab xenrlptm
tab xenrlptw
tab xsatnum
tab xsatpct
tab xactnum
tab xactpct
tab xsatvr25
tab xsatvr75
tab xsatmt25
tab xsatmt75
tab xsatwr25
tab xsatwr75
tab xactcm25
tab xactcm75
tab xacten25
tab xacten75
tab xactmt25
tab xactmt75
tab xactwr25
tab xactwr75
summarize applcn
summarize applcnm
summarize applcnw
summarize admssn
summarize admssnm
summarize admssnw
summarize enrlt
summarize enrlm
summarize enrlw
summarize enrlft
summarize enrlftm
summarize enrlftw
summarize enrlpt
summarize enrlptm
summarize enrlptw
summarize satnum
summarize satpct
summarize actnum
summarize actpct
summarize satvr25
summarize satvr75
summarize satmt25
summarize satmt75
summarize satwr25
summarize satwr75
summarize actcm25
summarize actcm75
summarize acten25
summarize acten75
summarize actmt25
summarize actmt75
summarize actwr25
summarize actwr75
 // save dct_adm2014
