* Created: 5/25/2006 4:56:25 PM
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
// insheet using "c:\dct\effy2003_data_stata.csv", comma clear
label data "dct_effy2003"
label variable unitid "unitid"
label variable effylev "Level of student"
label variable lstudy "Original level of study on survey form"
label variable xfyrac01 "Imputation field for FYRACE01 - Nonresident alien men"
label variable fyrace01 "Nonresident alien men"
label variable xfyrac02 "Imputation field for FYRACE02 - Nonresident alien women"
label variable fyrace02 "Nonresident alien women"
label variable xfyrac03 "Imputation field for FYRACE03 - Black, non-Hispanic men"
label variable fyrace03 "Black, non-Hispanic men"
label variable xfyrac04 "Imputation field for FYRACE04 - Black, non-Hispanic women"
label variable fyrace04 "Black, non-Hispanic women"
label variable xfyrac05 "Imputation field for FYRACE05 - American Indian or Alaska Native men"
label variable fyrace05 "American Indian or Alaska Native men"
label variable xfyrac06 "Imputation field for FYRACE06 - American Indian or Alaska Native women"
label variable fyrace06 "American Indian or Alaska Native women"
label variable xfyrac07 "Imputation field for FYRACE07 - Asian or Pacific Islander men"
label variable fyrace07 "Asian or Pacific Islander men"
label variable xfyrac08 "Imputation field for FYRACE08 - Asian or Pacific Islander women"
label variable fyrace08 "Asian or Pacific Islander women"
label variable xfyrac09 "Imputation field for FYRACE09 - Hispanic men"
label variable fyrace09 "Hispanic men"
label variable xfyrac10 "Imputation field for FYRACE10 - Hispanic women"
label variable fyrace10 "Hispanic women"
label variable xfyrac11 "Imputation field for FYRACE11 - White, non-Hispanic men"
label variable fyrace11 "White, non-Hispanic men"
label variable xfyrac12 "Imputation field for FYRACE12 - White, non-Hispanic women"
label variable fyrace12 "White, non-Hispanic women"
label variable xfyrac13 "Imputation field for FYRACE13 - Race/ethnicity unknown men"
label variable fyrace13 "Race/ethnicity unknown men"
label variable xfyrac14 "Imputation field for FYRACE14 - Race/ethnicity unknown women"
label variable fyrace14 "Race/ethnicity unknown women"
label variable xfyrac15 "Imputation field for FYRACE15 - Grand total men"
label variable fyrace15 "Grand total men"
label variable xfyrac16 "Imputation field for FYRACE16 - Grand total women"
label variable fyrace16 "Grand total women"
label variable xfyrac17 "Imputation field for FYRACE17 - Nonresident alien total"
label variable fyrace17 "Nonresident alien total"
label variable xfyrac18 "Imputation field for FYRACE18 - Black, non-Hispanic  total"
label variable fyrace18 "Black, non-Hispanic  total"
label variable xfyrac19 "Imputation field for FYRACE19 - American Indian or Alaska Native total"
label variable fyrace19 "American Indian or Alaska Native total"
label variable xfyrac20 "Imputation field for FYRACE20 - Asian or Pacific Islander total"
label variable fyrace20 "Asian or Pacific Islander total"
label variable xfyrac21 "Imputation field for FYRACE21 - Hispanic total"
label variable fyrace21 "Hispanic total"
label variable xfyrac22 "Imputation field for FYRACE22 - White, non-Hispanic total"
label variable fyrace22 "White, non-Hispanic total"
label variable xfyrac23 "Imputation field for FYRACE23 - Race/ethnicity unknown total"
label variable fyrace23 "Race/ethnicity unknown total"
label variable xfyrac24 "Imputation field for FYRACE24 - Grand total"
label variable fyrace24 "Grand total"
label define label_effylev 1 "All students total" 
label define label_effylev 2 "Undergraduate", add 
label define label_effylev 3 "First professional", add 
label define label_effylev 4 "Graduate", add 
label values effylev label_effylev
label define label_lstudy 1 "Undergraduate" 
label define label_lstudy 2 "First professional", add 
label define label_lstudy 3 "Graduate", add 
label define label_lstudy 999 "Generated total", add 
label values lstudy label_lstudy
label define label_xfyrac01 10 "Reported" 
label define label_xfyrac01 11 "Analyst corrected reported value", add 
label define label_xfyrac01 12 "Data generated from other data values", add 
label define label_xfyrac01 13 "Implied zero", add 
label define label_xfyrac01 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac01 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac01 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac01 23 "Logical imputation", add 
label define label_xfyrac01 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac01 30 "Not applicable", add 
label define label_xfyrac01 31 "Institution left item blank", add 
label define label_xfyrac01 32 "Do not know", add 
label define label_xfyrac01 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac01 50 "Outlier value derived from reported data", add 
label define label_xfyrac01 51 "Outlier value derived from imputed data", add 
label define label_xfyrac01 52 "Value not derived - parent/child differs across components", add 
label values xfyrac01 label_xfyrac01
label define label_xfyrac02 10 "Reported" 
label define label_xfyrac02 11 "Analyst corrected reported value", add 
label define label_xfyrac02 12 "Data generated from other data values", add 
label define label_xfyrac02 13 "Implied zero", add 
label define label_xfyrac02 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac02 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac02 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac02 23 "Logical imputation", add 
label define label_xfyrac02 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac02 30 "Not applicable", add 
label define label_xfyrac02 31 "Institution left item blank", add 
label define label_xfyrac02 32 "Do not know", add 
label define label_xfyrac02 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac02 50 "Outlier value derived from reported data", add 
label define label_xfyrac02 51 "Outlier value derived from imputed data", add 
label define label_xfyrac02 52 "Value not derived - parent/child differs across components", add 
label values xfyrac02 label_xfyrac02
label define label_xfyrac03 10 "Reported" 
label define label_xfyrac03 11 "Analyst corrected reported value", add 
label define label_xfyrac03 12 "Data generated from other data values", add 
label define label_xfyrac03 13 "Implied zero", add 
label define label_xfyrac03 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac03 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac03 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac03 23 "Logical imputation", add 
label define label_xfyrac03 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac03 30 "Not applicable", add 
label define label_xfyrac03 31 "Institution left item blank", add 
label define label_xfyrac03 32 "Do not know", add 
label define label_xfyrac03 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac03 50 "Outlier value derived from reported data", add 
label define label_xfyrac03 51 "Outlier value derived from imputed data", add 
label define label_xfyrac03 52 "Value not derived - parent/child differs across components", add 
label values xfyrac03 label_xfyrac03
label define label_xfyrac04 10 "Reported" 
label define label_xfyrac04 11 "Analyst corrected reported value", add 
label define label_xfyrac04 12 "Data generated from other data values", add 
label define label_xfyrac04 13 "Implied zero", add 
label define label_xfyrac04 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac04 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac04 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac04 23 "Logical imputation", add 
label define label_xfyrac04 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac04 30 "Not applicable", add 
label define label_xfyrac04 31 "Institution left item blank", add 
label define label_xfyrac04 32 "Do not know", add 
label define label_xfyrac04 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac04 50 "Outlier value derived from reported data", add 
label define label_xfyrac04 51 "Outlier value derived from imputed data", add 
label define label_xfyrac04 52 "Value not derived - parent/child differs across components", add 
label values xfyrac04 label_xfyrac04
label define label_xfyrac05 10 "Reported" 
label define label_xfyrac05 11 "Analyst corrected reported value", add 
label define label_xfyrac05 12 "Data generated from other data values", add 
label define label_xfyrac05 13 "Implied zero", add 
label define label_xfyrac05 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac05 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac05 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac05 23 "Logical imputation", add 
label define label_xfyrac05 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac05 30 "Not applicable", add 
label define label_xfyrac05 31 "Institution left item blank", add 
label define label_xfyrac05 32 "Do not know", add 
label define label_xfyrac05 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac05 50 "Outlier value derived from reported data", add 
label define label_xfyrac05 51 "Outlier value derived from imputed data", add 
label define label_xfyrac05 52 "Value not derived - parent/child differs across components", add 
label values xfyrac05 label_xfyrac05
label define label_xfyrac06 10 "Reported" 
label define label_xfyrac06 11 "Analyst corrected reported value", add 
label define label_xfyrac06 12 "Data generated from other data values", add 
label define label_xfyrac06 13 "Implied zero", add 
label define label_xfyrac06 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac06 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac06 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac06 23 "Logical imputation", add 
label define label_xfyrac06 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac06 30 "Not applicable", add 
label define label_xfyrac06 31 "Institution left item blank", add 
label define label_xfyrac06 32 "Do not know", add 
label define label_xfyrac06 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac06 50 "Outlier value derived from reported data", add 
label define label_xfyrac06 51 "Outlier value derived from imputed data", add 
label define label_xfyrac06 52 "Value not derived - parent/child differs across components", add 
label values xfyrac06 label_xfyrac06
label define label_xfyrac07 10 "Reported" 
label define label_xfyrac07 11 "Analyst corrected reported value", add 
label define label_xfyrac07 12 "Data generated from other data values", add 
label define label_xfyrac07 13 "Implied zero", add 
label define label_xfyrac07 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac07 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac07 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac07 23 "Logical imputation", add 
label define label_xfyrac07 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac07 30 "Not applicable", add 
label define label_xfyrac07 31 "Institution left item blank", add 
label define label_xfyrac07 32 "Do not know", add 
label define label_xfyrac07 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac07 50 "Outlier value derived from reported data", add 
label define label_xfyrac07 51 "Outlier value derived from imputed data", add 
label define label_xfyrac07 52 "Value not derived - parent/child differs across components", add 
label values xfyrac07 label_xfyrac07
label define label_xfyrac08 10 "Reported" 
label define label_xfyrac08 11 "Analyst corrected reported value", add 
label define label_xfyrac08 12 "Data generated from other data values", add 
label define label_xfyrac08 13 "Implied zero", add 
label define label_xfyrac08 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac08 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac08 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac08 23 "Logical imputation", add 
label define label_xfyrac08 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac08 30 "Not applicable", add 
label define label_xfyrac08 31 "Institution left item blank", add 
label define label_xfyrac08 32 "Do not know", add 
label define label_xfyrac08 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac08 50 "Outlier value derived from reported data", add 
label define label_xfyrac08 51 "Outlier value derived from imputed data", add 
label define label_xfyrac08 52 "Value not derived - parent/child differs across components", add 
label values xfyrac08 label_xfyrac08
label define label_xfyrac09 10 "Reported" 
label define label_xfyrac09 11 "Analyst corrected reported value", add 
label define label_xfyrac09 12 "Data generated from other data values", add 
label define label_xfyrac09 13 "Implied zero", add 
label define label_xfyrac09 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac09 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac09 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac09 23 "Logical imputation", add 
label define label_xfyrac09 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac09 30 "Not applicable", add 
label define label_xfyrac09 31 "Institution left item blank", add 
label define label_xfyrac09 32 "Do not know", add 
label define label_xfyrac09 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac09 50 "Outlier value derived from reported data", add 
label define label_xfyrac09 51 "Outlier value derived from imputed data", add 
label define label_xfyrac09 52 "Value not derived - parent/child differs across components", add 
label values xfyrac09 label_xfyrac09
label define label_xfyrac10 10 "Reported" 
label define label_xfyrac10 11 "Analyst corrected reported value", add 
label define label_xfyrac10 12 "Data generated from other data values", add 
label define label_xfyrac10 13 "Implied zero", add 
label define label_xfyrac10 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac10 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac10 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac10 23 "Logical imputation", add 
label define label_xfyrac10 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac10 30 "Not applicable", add 
label define label_xfyrac10 31 "Institution left item blank", add 
label define label_xfyrac10 32 "Do not know", add 
label define label_xfyrac10 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac10 50 "Outlier value derived from reported data", add 
label define label_xfyrac10 51 "Outlier value derived from imputed data", add 
label define label_xfyrac10 52 "Value not derived - parent/child differs across components", add 
label values xfyrac10 label_xfyrac10
label define label_xfyrac11 10 "Reported" 
label define label_xfyrac11 11 "Analyst corrected reported value", add 
label define label_xfyrac11 12 "Data generated from other data values", add 
label define label_xfyrac11 13 "Implied zero", add 
label define label_xfyrac11 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac11 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac11 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac11 23 "Logical imputation", add 
label define label_xfyrac11 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac11 30 "Not applicable", add 
label define label_xfyrac11 31 "Institution left item blank", add 
label define label_xfyrac11 32 "Do not know", add 
label define label_xfyrac11 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac11 50 "Outlier value derived from reported data", add 
label define label_xfyrac11 51 "Outlier value derived from imputed data", add 
label define label_xfyrac11 52 "Value not derived - parent/child differs across components", add 
label values xfyrac11 label_xfyrac11
label define label_xfyrac12 10 "Reported" 
label define label_xfyrac12 11 "Analyst corrected reported value", add 
label define label_xfyrac12 12 "Data generated from other data values", add 
label define label_xfyrac12 13 "Implied zero", add 
label define label_xfyrac12 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac12 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac12 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac12 23 "Logical imputation", add 
label define label_xfyrac12 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac12 30 "Not applicable", add 
label define label_xfyrac12 31 "Institution left item blank", add 
label define label_xfyrac12 32 "Do not know", add 
label define label_xfyrac12 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac12 50 "Outlier value derived from reported data", add 
label define label_xfyrac12 51 "Outlier value derived from imputed data", add 
label define label_xfyrac12 52 "Value not derived - parent/child differs across components", add 
label values xfyrac12 label_xfyrac12
label define label_xfyrac13 10 "Reported" 
label define label_xfyrac13 11 "Analyst corrected reported value", add 
label define label_xfyrac13 12 "Data generated from other data values", add 
label define label_xfyrac13 13 "Implied zero", add 
label define label_xfyrac13 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac13 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac13 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac13 23 "Logical imputation", add 
label define label_xfyrac13 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac13 30 "Not applicable", add 
label define label_xfyrac13 31 "Institution left item blank", add 
label define label_xfyrac13 32 "Do not know", add 
label define label_xfyrac13 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac13 50 "Outlier value derived from reported data", add 
label define label_xfyrac13 51 "Outlier value derived from imputed data", add 
label define label_xfyrac13 52 "Value not derived - parent/child differs across components", add 
label values xfyrac13 label_xfyrac13
label define label_xfyrac14 10 "Reported" 
label define label_xfyrac14 11 "Analyst corrected reported value", add 
label define label_xfyrac14 12 "Data generated from other data values", add 
label define label_xfyrac14 13 "Implied zero", add 
label define label_xfyrac14 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac14 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac14 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac14 23 "Logical imputation", add 
label define label_xfyrac14 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac14 30 "Not applicable", add 
label define label_xfyrac14 31 "Institution left item blank", add 
label define label_xfyrac14 32 "Do not know", add 
label define label_xfyrac14 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac14 50 "Outlier value derived from reported data", add 
label define label_xfyrac14 51 "Outlier value derived from imputed data", add 
label define label_xfyrac14 52 "Value not derived - parent/child differs across components", add 
label values xfyrac14 label_xfyrac14
label define label_xfyrac15 10 "Reported" 
label define label_xfyrac15 11 "Analyst corrected reported value", add 
label define label_xfyrac15 12 "Data generated from other data values", add 
label define label_xfyrac15 13 "Implied zero", add 
label define label_xfyrac15 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac15 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac15 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac15 23 "Logical imputation", add 
label define label_xfyrac15 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac15 30 "Not applicable", add 
label define label_xfyrac15 31 "Institution left item blank", add 
label define label_xfyrac15 32 "Do not know", add 
label define label_xfyrac15 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac15 50 "Outlier value derived from reported data", add 
label define label_xfyrac15 51 "Outlier value derived from imputed data", add 
label define label_xfyrac15 52 "Value not derived - parent/child differs across components", add 
label values xfyrac15 label_xfyrac15
label define label_xfyrac16 10 "Reported" 
label define label_xfyrac16 11 "Analyst corrected reported value", add 
label define label_xfyrac16 12 "Data generated from other data values", add 
label define label_xfyrac16 13 "Implied zero", add 
label define label_xfyrac16 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac16 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac16 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac16 23 "Logical imputation", add 
label define label_xfyrac16 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac16 30 "Not applicable", add 
label define label_xfyrac16 31 "Institution left item blank", add 
label define label_xfyrac16 32 "Do not know", add 
label define label_xfyrac16 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac16 50 "Outlier value derived from reported data", add 
label define label_xfyrac16 51 "Outlier value derived from imputed data", add 
label define label_xfyrac16 52 "Value not derived - parent/child differs across components", add 
label values xfyrac16 label_xfyrac16
label define label_xfyrac17 10 "Reported" 
label define label_xfyrac17 11 "Analyst corrected reported value", add 
label define label_xfyrac17 12 "Data generated from other data values", add 
label define label_xfyrac17 13 "Implied zero", add 
label define label_xfyrac17 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac17 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac17 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac17 23 "Logical imputation", add 
label define label_xfyrac17 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac17 30 "Not applicable", add 
label define label_xfyrac17 31 "Institution left item blank", add 
label define label_xfyrac17 32 "Do not know", add 
label define label_xfyrac17 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac17 50 "Outlier value derived from reported data", add 
label define label_xfyrac17 51 "Outlier value derived from imputed data", add 
label define label_xfyrac17 52 "Value not derived - parent/child differs across components", add 
label values xfyrac17 label_xfyrac17
label define label_xfyrac18 10 "Reported" 
label define label_xfyrac18 11 "Analyst corrected reported value", add 
label define label_xfyrac18 12 "Data generated from other data values", add 
label define label_xfyrac18 13 "Implied zero", add 
label define label_xfyrac18 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac18 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac18 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac18 23 "Logical imputation", add 
label define label_xfyrac18 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac18 30 "Not applicable", add 
label define label_xfyrac18 31 "Institution left item blank", add 
label define label_xfyrac18 32 "Do not know", add 
label define label_xfyrac18 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac18 50 "Outlier value derived from reported data", add 
label define label_xfyrac18 51 "Outlier value derived from imputed data", add 
label define label_xfyrac18 52 "Value not derived - parent/child differs across components", add 
label values xfyrac18 label_xfyrac18
label define label_xfyrac19 10 "Reported" 
label define label_xfyrac19 11 "Analyst corrected reported value", add 
label define label_xfyrac19 12 "Data generated from other data values", add 
label define label_xfyrac19 13 "Implied zero", add 
label define label_xfyrac19 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac19 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac19 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac19 23 "Logical imputation", add 
label define label_xfyrac19 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac19 30 "Not applicable", add 
label define label_xfyrac19 31 "Institution left item blank", add 
label define label_xfyrac19 32 "Do not know", add 
label define label_xfyrac19 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac19 50 "Outlier value derived from reported data", add 
label define label_xfyrac19 51 "Outlier value derived from imputed data", add 
label define label_xfyrac19 52 "Value not derived - parent/child differs across components", add 
label values xfyrac19 label_xfyrac19
label define label_xfyrac20 10 "Reported" 
label define label_xfyrac20 11 "Analyst corrected reported value", add 
label define label_xfyrac20 12 "Data generated from other data values", add 
label define label_xfyrac20 13 "Implied zero", add 
label define label_xfyrac20 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac20 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac20 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac20 23 "Logical imputation", add 
label define label_xfyrac20 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac20 30 "Not applicable", add 
label define label_xfyrac20 31 "Institution left item blank", add 
label define label_xfyrac20 32 "Do not know", add 
label define label_xfyrac20 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac20 50 "Outlier value derived from reported data", add 
label define label_xfyrac20 51 "Outlier value derived from imputed data", add 
label define label_xfyrac20 52 "Value not derived - parent/child differs across components", add 
label values xfyrac20 label_xfyrac20
label define label_xfyrac21 10 "Reported" 
label define label_xfyrac21 11 "Analyst corrected reported value", add 
label define label_xfyrac21 12 "Data generated from other data values", add 
label define label_xfyrac21 13 "Implied zero", add 
label define label_xfyrac21 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac21 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac21 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac21 23 "Logical imputation", add 
label define label_xfyrac21 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac21 30 "Not applicable", add 
label define label_xfyrac21 31 "Institution left item blank", add 
label define label_xfyrac21 32 "Do not know", add 
label define label_xfyrac21 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac21 50 "Outlier value derived from reported data", add 
label define label_xfyrac21 51 "Outlier value derived from imputed data", add 
label define label_xfyrac21 52 "Value not derived - parent/child differs across components", add 
label values xfyrac21 label_xfyrac21
label define label_xfyrac22 10 "Reported" 
label define label_xfyrac22 11 "Analyst corrected reported value", add 
label define label_xfyrac22 12 "Data generated from other data values", add 
label define label_xfyrac22 13 "Implied zero", add 
label define label_xfyrac22 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac22 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac22 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac22 23 "Logical imputation", add 
label define label_xfyrac22 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac22 30 "Not applicable", add 
label define label_xfyrac22 31 "Institution left item blank", add 
label define label_xfyrac22 32 "Do not know", add 
label define label_xfyrac22 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac22 50 "Outlier value derived from reported data", add 
label define label_xfyrac22 51 "Outlier value derived from imputed data", add 
label define label_xfyrac22 52 "Value not derived - parent/child differs across components", add 
label values xfyrac22 label_xfyrac22
label define label_xfyrac23 10 "Reported" 
label define label_xfyrac23 11 "Analyst corrected reported value", add 
label define label_xfyrac23 12 "Data generated from other data values", add 
label define label_xfyrac23 13 "Implied zero", add 
label define label_xfyrac23 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac23 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac23 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac23 23 "Logical imputation", add 
label define label_xfyrac23 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac23 30 "Not applicable", add 
label define label_xfyrac23 31 "Institution left item blank", add 
label define label_xfyrac23 32 "Do not know", add 
label define label_xfyrac23 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac23 50 "Outlier value derived from reported data", add 
label define label_xfyrac23 51 "Outlier value derived from imputed data", add 
label define label_xfyrac23 52 "Value not derived - parent/child differs across components", add 
label values xfyrac23 label_xfyrac23
label define label_xfyrac24 10 "Reported" 
label define label_xfyrac24 11 "Analyst corrected reported value", add 
label define label_xfyrac24 12 "Data generated from other data values", add 
label define label_xfyrac24 13 "Implied zero", add 
label define label_xfyrac24 20 "Imputed using Carry Forward procedure", add 
label define label_xfyrac24 21 "Imputed using Nearest Neighbor procedure", add 
label define label_xfyrac24 22 "Imputed using the Group Median procedure", add 
label define label_xfyrac24 23 "Logical imputation", add 
label define label_xfyrac24 24 "Ratio adjustment based on enrollment  by race and gender (part A)", add 
label define label_xfyrac24 30 "Not applicable", add 
label define label_xfyrac24 31 "Institution left item blank", add 
label define label_xfyrac24 32 "Do not know", add 
label define label_xfyrac24 33 "Particular 1st prof field not applicable", add 
label define label_xfyrac24 50 "Outlier value derived from reported data", add 
label define label_xfyrac24 51 "Outlier value derived from imputed data", add 
label define label_xfyrac24 52 "Value not derived - parent/child differs across components", add 
label values xfyrac24 label_xfyrac24
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
// save dct_effy2003

