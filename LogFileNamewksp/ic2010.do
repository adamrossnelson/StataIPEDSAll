* Created: April 12, 2012
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
// insheet using "c:\dct\ic2010_rv_data_stata.csv", comma clear
label data "dct_ic2010_rv"
label variable unitid "unitid"
label variable peo1istr "Occupational"
label variable peo2istr "Academic"
label variable peo3istr "Continuing professional"
label variable peo4istr "Recreational or avocational"
label variable peo5istr "Adult basic remedial or high school equivalent"
label variable peo6istr "Secondary (high school)"
label variable cntlaffi "Institutional control or affiliation"
label variable pubprime "Primary public control"
label variable pubsecon "Secondary public control"
label variable relaffil "Religious affiliation"
label variable level1 "Less than one year certificate"
label variable level2 "One but less than two years certificate"
label variable level3 "Associate^s degree"
label variable level4 "Two but less than 4 years certificate"
label variable level5 "Bachelor^s degree"
label variable level6 "Postbaccalaureate certificate"
label variable level7 "Master^s degree"
label variable level8 "Post-master^s certificate"
label variable level12 "Other degree"
label variable level17 "Doctor^s degree - research/scholarship (new classification)"
label variable level18 "Doctor^s degree - professional practice (new classification)"
label variable level19 "Doctor^s degree - other (new classification)"
label variable openadmp "Open admission policy"
label variable admcon1 "Secondary school GPA"
label variable admcon2 "Secondary school rank"
label variable admcon3 "Secondary school record"
label variable admcon4 "Completion of college-prepatory program"
label variable admcon5 "Recommendations"
label variable admcon6 "Formal demonstration of competencies"
label variable admcon7 "Admission test scores"
label variable admcon8 "TOEFL (Test of English as a Foreign Language"
label variable admcon9 "Other Test (Wonderlic, WISC-III, etc.)"
label variable appdate "Fall reporting period for applicant and admissions"
label variable xapplcnm "Imputation field for APPLCNM - Applicants men"
label variable applcnm "Applicants men"
label variable xapplcnw "Imputation field for APPLCNW - Applicants women"
label variable applcnw "Applicants women"
label variable xadmssnm "Imputation field for ADMSSNM - Admissions men"
label variable admssnm "Admissions men"
label variable xadmssnw "Imputation field for ADMSSNW - Admissions women"
label variable admssnw "Admissions women"
label variable xenrlftm "Imputation field for ENRLFTM - Enrolled full time men"
label variable enrlftm "Enrolled full time men"
label variable xenrlftw "Imputation field for ENRLFTW - Enrolled full time women"
label variable enrlftw "Enrolled full time women"
label variable xenrlptm "Imputation field for ENRLPTM - Enrolled part time men"
label variable enrlptm "Enrolled part time men"
label variable xenrlptw "Imputation field for ENRLPTW - Enrolled part time women"
label variable enrlptw "Enrolled part time women"
label variable satactdt "Fall reporting period for SAT/ACT test scores"
label variable xsatnum "Imputation field for SATNUM - Number of first-time degree/certificate-seeking students submitting SAT scores"
label variable satnum "Number of first-time degree/certificate-seeking students submitting SAT scores"
label variable xsatpct "Imputation field for SATPCT - Percent of first-time degree/certificate-seeking students submitting SAT scores"
label variable satpct "Percent of first-time degree/certificate-seeking students submitting SAT scores"
label variable xactnum "Imputation field for ACTNUM -  Number of first-time degree/certificate-seeking students submitting ACT scores"
label variable actnum "Number of first-time degree/certificate-seeking students submitting ACT scores"
label variable xactpct "Imputation field for ACTPCT - Percent of first-time degree/certificate-seeking students submitting ACT scores"
label variable actpct "Percent of first-time degree/certificate-seeking students submitting ACT scores"
label variable xsatvr25 "Imputation field for SATVR25 - SAT Critical Reading 25th percentile score"
label variable satvr25 "SAT Critical Reading 25th percentile score"
label variable xsatvr75 "Imputation field for SATVR75 - SAT Critical Reading 75th percentile score"
label variable satvr75 "SAT Critical Reading 75th percentile score"
label variable xsatmt25 "Imputation field for SATMT25 - SAT Math 25th percentile score"
label variable satmt25 "SAT Math 25th percentile score"
label variable xsatmt75 "Imputation field for SATMT75 - SAT Math 75th percentile score"
label variable satmt75 "SAT Math 75th percentile score"
label variable xsatwr25 "Imputation field for SATWR25 - SAT Writing 25th percentile score"
label variable satwr25 "SAT Writing 25th percentile score"
label variable xsatwr75 "Imputation field for SATWR75 - SAT Writing 75th percentile score"
label variable satwr75 "SAT Writing 75th percentile score"
label variable xactcm25 "Imputation field for ACTCM25 - ACT Composite 25th percentile score"
label variable actcm25 "ACT Composite 25th percentile score"
label variable xactcm75 "Imputation field for ACTCM75 - ACT Composite 75th percentile score"
label variable actcm75 "ACT Composite 75th percentile score"
label variable xacten25 "Imputation field for ACTEN25 - ACT English 25th percentile score"
label variable acten25 "ACT English 25th percentile score"
label variable xacten75 "Imputation field for ACTEN75 - ACT English 75th percentile score"
label variable acten75 "ACT English 75th percentile score"
label variable xactmt25 "Imputation field for ACTMT25 - ACT Math 25th percentile score"
label variable actmt25 "ACT Math 25th percentile score"
label variable xactmt75 "Imputation field for ACTMT75 - ACT Math 75th percentile score"
label variable actmt75 "ACT Math 75th percentile score"
label variable xactwr25 "Imputation field for ACTWR25 - ACT Writing 25th percentile score"
label variable actwr25 "ACT Writing 25th percentile score"
label variable xactwr75 "Imputation field for ACTWR75 - ACT Writing 75th percentile score"
label variable actwr75 "ACT Writing 75th percentile score"
label variable credits1 "Dual credit"
label variable credits2 "Credit for life experiences"
label variable credits3 "Advanced placement (AP) credits"
label variable credits4 "Institution does not accept dual, credit for life, or AP credits"
label variable slo3 "Distance learning opportunities"
label variable slo5 "ROTC"
label variable slo51 "ROTC - Army"
label variable slo52 "ROTC - Navy"
label variable slo53 "ROTC - Air Force"
label variable slo6 "Study abroad"
label variable slo7 "Weekend/evening  college"
label variable slo8 "Teacher certification (below the postsecondary level)"
label variable slo81 "Teacher certification"
label variable slo82 "Teacher certification"
label variable slo83 "Teacher certification"
label variable slo9 "None of the above special learning opportunities are offered"
label variable yrscoll "Years of college-level work required"
label variable stusrv1 "Remedial services"
label variable stusrv2 "Academic/career counseling service"
label variable stusrv3 "Employment services for students"
label variable stusrv4 "Placement services for completers"
label variable stusrv8 "On-campus day care for students^ children"
label variable stusrv9 "None of the above selected services are offered"
label variable libfac "Library facilities at institution"
label variable athassoc "Member of National Athletic Association"
label variable assoc1 "Member of National Collegiate Athletic Association (NCAA)"
label variable assoc2 "Member of National Association of Intercollegiate Athletics (NAIA)"
label variable assoc3 "Member of National Junior College Athletic  Association (NJCAA)"
label variable assoc4 "Member of National Small College Athletic Association (NSCAA)"
label variable assoc5 "Member of National Christian College Athletic Association (NCCAA)"
label variable assoc6 "Member of other national athletic association not listed above"
label variable sport1 "NCAA/NAIA member for football"
label variable confno1 "NCAA/NAIA conference number football"
label variable sport2 "NCAA/NAIA member for basketball"
label variable confno2 "NCAA/NAIA conference number basketball"
label variable sport3 "NCAA/NAIA member for baseball"
label variable confno3 "NCAA/NAIA conference number baseball"
label variable sport4 "NCAA/NAIA member for cross country/track"
label variable confno4 "NCAA/NAIA conference number cross country/track"
label variable calsys "Calendar system"
label variable xappfeeu "Imputation field for APPLFEEU - Undergraduate application fee"
label variable applfeeu "Undergraduate application fee"
label variable xappfeeg "Imputation field for APPLFEEG - Graduate application fee"
label variable applfeeg "Graduate application fee"
label variable ft_ug "Full-time undergraduate students are enrolled"
label variable ft_ftug "Full time first-time degree/certificate-seeking undergraduate students enrolled"
label variable ft_gd "Full-time graduate students are enrolled"
label variable pt_ug "Part-time undergraduate students are enrolled"
label variable pt_ftug "Part time first-time degree/certificate-seeking undergraduate students enrolled"
label variable pt_gd "Part-time graduate students are enrolled"
label variable tuitvary "Tuition charge varies for in-district, in-state, out-of-state students"
label variable room "Institution provide on-campus housing"
label variable xroomcap "Imputation field for ROOMCAP - Total dormitory capacity"
label variable roomcap "Total dormitory capacity"
label variable board "Institution provides board or meal plan"
label variable xmealswk "Imputation field for MEALSWK - Number of meals per week in board charge"
label variable mealswk "Number of meals per week in board charge"
label variable xroomamt "Imputation field for ROOMAMT - Typical room charge for academic year"
label variable roomamt "Typical room charge for academic year"
label variable xbordamt "Imputation field for BOARDAMT - Typical board charge for academic year"
label variable boardamt "Typical board charge for academic year"
label variable xrmbdamt "Imputation field for RMBRDAMT - Combined charge for room and board"
label variable rmbrdamt "Combined charge for room and board"
label variable alloncam "Full-time, first-time degree/certificate-seeking students required to live on campus"
label variable xenrlm "Imputation field for ENRLM - Enrolled  men"
label variable enrlm "Enrolled  men"
label variable xenrlw "Imputation field for ENRLW - Enrolled  women"
label variable enrlw "Enrolled  women"
label variable xenrlt "Imputation field for ENRLT - Enrolled total"
label variable enrlt "Enrolled total"
label variable xapplcn "Imputation field for APPLCN - Applicants total"
label variable applcn "Applicants total"
label variable xadmssn "Imputation field for ADMSSN - Admissions total"
label variable admssn "Admissions total"
label variable xenrlft "Imputation field for ENRLFT - Enrolled full time total"
label variable enrlft "Enrolled full time total"
label variable xenrlpt "Imputation field for ENRLPT - Enrolled part time total"
label variable enrlpt "Enrolled part time total"
label variable tuitpl "Any alternative tuition plans offered by institution"
label variable tuitpl1 "Tuition guaranteed plan"
label variable tuitpl2 "Prepaid tuition plan"
label variable tuitpl3 "Tuition payment plan"
label variable tuitpl4 "Other alternative tuition plan"
label variable disab "Percent indicator of undergraduates formally registered as students with disabilities"
label variable xdisabpc "Imputation field for DISABPCT - Percent of undergraduates, who are formally registered as students with disabilities, when percentage is more than 3 percent"
label variable disabpct "Percent of undergraduates, who are formally registered as students with disabilities, when percentage is more than 3 percent"
label define label_peo1istr -1 "Not reported" 
label define label_peo1istr 0 "Implied no", add 
label define label_peo1istr 1 "Yes", add 
label values peo1istr label_peo1istr
label define label_peo2istr -1 "Not reported" 
label define label_peo2istr 0 "Implied no", add 
label define label_peo2istr 1 "Yes", add 
label values peo2istr label_peo2istr
label define label_peo3istr -1 "Not reported" 
label define label_peo3istr -2 "Not applicable", add 
label define label_peo3istr 0 "Implied no", add 
label define label_peo3istr 1 "Yes", add 
label values peo3istr label_peo3istr
label define label_peo4istr -1 "Not reported" 
label define label_peo4istr 0 "Implied no", add 
label define label_peo4istr 1 "Yes", add 
label values peo4istr label_peo4istr
label define label_peo5istr -1 "Not reported" 
label define label_peo5istr 0 "Implied no", add 
label define label_peo5istr 1 "Yes", add 
label values peo5istr label_peo5istr
label define label_peo6istr -1 "Not reported" 
label define label_peo6istr 0 "Implied no", add 
label define label_peo6istr 1 "Yes", add 
label values peo6istr label_peo6istr
label define label_cntlaffi -1 "Not reported" 
label define label_cntlaffi 1 "Public", add 
label define label_cntlaffi 2 "Private for-profit", add 
label define label_cntlaffi 3 "Private not-for-profit (no religious affiliation)", add 
label define label_cntlaffi 4 "Private not-for-profit (religious affiliation)", add 
label values cntlaffi label_cntlaffi
label define label_pubprime -1 "Not reported" 
label define label_pubprime -2 "Not applicable", add 
label define label_pubprime 1 "Federal", add 
label define label_pubprime 2 "State", add 
label define label_pubprime 3 "Territorial", add 
label define label_pubprime 4 "School district", add 
label define label_pubprime 5 "County", add 
label define label_pubprime 6 "Township", add 
label define label_pubprime 7 "City", add 
label define label_pubprime 8 "Special district", add 
label define label_pubprime 9 "Other", add 
label values pubprime label_pubprime
label define label_pubsecon -1 "Not reported" 
label define label_pubsecon -2 "Not applicable", add 
label define label_pubsecon 0 "Implied no", add 
label define label_pubsecon 1 "Federal", add 
label define label_pubsecon 2 "State", add 
label define label_pubsecon 3 "Territorial", add 
label define label_pubsecon 4 "School district", add 
label define label_pubsecon 5 "County", add 
label define label_pubsecon 6 "Township", add 
label define label_pubsecon 7 "City", add 
label define label_pubsecon 8 "Special district", add 
label define label_pubsecon 9 "Other", add 
label values pubsecon label_pubsecon
label define label_relaffil -1 "Not reported" 
label define label_relaffil -2 "Not applicable", add 
label define label_relaffil 100 "Original Free Will Baptist", add 
label define label_relaffil 22 "American Evangelical Lutheran Church", add 
label define label_relaffil 24 "African Methodist Episcopal Zion Church", add 
label define label_relaffil 27 "Assemblies of God Church", add 
label define label_relaffil 28 "Brethren Church", add 
label define label_relaffil 30 "Roman Catholic", add 
label define label_relaffil 33 "Wisconsin Evangelical Lutheran Synod", add 
label define label_relaffil 34 "Christ and Missionary Alliance Church", add 
label define label_relaffil 35 "Christian Reformed Church", add 
label define label_relaffil 36 "Evangelical Congregational Church", add 
label define label_relaffil 37 "Evangelical Covenant Church of America", add 
label define label_relaffil 38 "Evangelical Free Church of America", add 
label define label_relaffil 39 "Evangelical Lutheran Church", add 
label define label_relaffil 40 "International United Pentecostal Church", add 
label define label_relaffil 41 "Free Will Baptist Church", add 
label define label_relaffil 42 "Interdenominational", add 
label define label_relaffil 43 "Mennonite Brethren Church", add 
label define label_relaffil 44 "Moravian Church", add 
label define label_relaffil 45 "North American Baptist", add 
label define label_relaffil 47 "Pentecostal Holiness Church", add 
label define label_relaffil 48 "Christian Churches and Churches of Christ", add 
label define label_relaffil 49 "Reformed Church in America", add 
label define label_relaffil 50 "Episcopal Church, Reformed", add 
label define label_relaffil 51 "African Methodist Episcopal", add 
label define label_relaffil 52 "American Baptist", add 
label define label_relaffil 53 "American Lutheran", add 
label define label_relaffil 54 "Baptist", add 
label define label_relaffil 55 "Christian Methodist Episcopal", add 
label define label_relaffil 57 "Church of God", add 
label define label_relaffil 58 "Church of Brethren", add 
label define label_relaffil 59 "Church of the Nazarene", add 
label define label_relaffil 60 "Cumberland Presbyterian", add 
label define label_relaffil 61 "Christian Church (Disciples of Christ)", add 
label define label_relaffil 64 "Free Methodist", add 
label define label_relaffil 65 "Friends", add 
label define label_relaffil 66 "Presbyterian Church (USA)", add 
label define label_relaffil 67 "Lutheran Church in America", add 
label define label_relaffil 68 "Lutheran Church - Missouri Synod", add 
label define label_relaffil 69 "Mennonite Church", add 
label define label_relaffil 71 "United Methodist", add 
label define label_relaffil 73 "Protestant Episcopal", add 
label define label_relaffil 74 "Churches of Christ", add 
label define label_relaffil 75 "Southern Baptist", add 
label define label_relaffil 76 "United Church of Christ", add 
label define label_relaffil 77 "Protestant, not specified", add 
label define label_relaffil 78 "Multiple Protestant Denomination", add 
label define label_relaffil 79 "Other Protestant", add 
label define label_relaffil 80 "Jewish", add 
label define label_relaffil 81 "Reformed Presbyterian Church", add 
label define label_relaffil 84 "United Brethren Church", add 
label define label_relaffil 87 "Missionary Church Inc", add 
label define label_relaffil 88 "Undenominational", add 
label define label_relaffil 89 "Wesleyan", add 
label define label_relaffil 91 "Greek Orthodox", add 
label define label_relaffil 92 "Russian Orthodox", add 
label define label_relaffil 93 "Unitarian Universalist", add 
label define label_relaffil 94 "Latter Day Saints (Mormon Church)", add 
label define label_relaffil 95 "Seventh Day Adventists", add 
label define label_relaffil 97 "The Presbyterian Church in America", add 
label define label_relaffil 99 "Other (none of the above)", add 
label values relaffil label_relaffil
label define label_level1 -1 "Not reported" 
label define label_level1 0 "Implied no", add 
label define label_level1 1 "Yes", add 
label values level1 label_level1
label define label_level2 -1 "Not applicable" 
label define label_level2 0 "Implied no", add 
label define label_level2 1 "Yes", add 
label values level2 label_level2
label define label_level3 -1 "Not reported" 
label define label_level3 0 "Implied no", add 
label define label_level3 1 "Yes", add 
label values level3 label_level3
label define label_level4 -1 "Not reported" 
label define label_level4 0 "Implied no", add 
label define label_level4 1 "Yes", add 
label values level4 label_level4
label define label_level5 -1 "Not reported" 
label define label_level5 -2 "Not applicable", add 
label define label_level5 0 "Implied no", add 
label define label_level5 1 "Yes", add 
label values level5 label_level5
label define label_level6 -1 "Not reported" 
label define label_level6 -2 "Not applicable", add 
label define label_level6 0 "Implied no", add 
label define label_level6 1 "Yes", add 
label values level6 label_level6
label define label_level7 -1 "Not reported" 
label define label_level7 -2 "Not applicable", add 
label define label_level7 0 "Implied no", add 
label define label_level7 1 "Yes", add 
label values level7 label_level7
label define label_level8 -1 "Not reported" 
label define label_level8 -2 "Not applicable", add 
label define label_level8 0 "Implied no", add 
label define label_level8 1 "Yes", add 
label values level8 label_level8
label define label_level12 -1 "Not reported" 
label define label_level12 0 "Implied no", add 
label define label_level12 1 "Yes", add 
label values level12 label_level12
label define label_level17 -1 "Not reported" 
label define label_level17 -2 "Not applicable", add 
label define label_level17 0 "Implied no", add 
label define label_level17 1 "Yes", add 
label values level17 label_level17
label define label_level18 -1 "Not reported" 
label define label_level18 -2 "Not applicable", add 
label define label_level18 0 "Implied no", add 
label define label_level18 1 "Yes", add 
label values level18 label_level18
label define label_level19 -1 "Not reported" 
label define label_level19 -2 "Not applicable", add 
label define label_level19 0 "Implied no", add 
label define label_level19 1 "Yes", add 
label values level19 label_level19
label define label_openadmp -1 "Not reported" 
label define label_openadmp -2 "Not applicable", add 
label define label_openadmp 1 "Yes", add 
label define label_openadmp 2 "No", add 
label values openadmp label_openadmp
label define label_admcon1 -1 "Not reported" 
label define label_admcon1 -2 "Not applicable", add 
label define label_admcon1 1 "Required", add 
label define label_admcon1 2 "Recommended", add 
label define label_admcon1 3 "Neither required nor recommended", add 
label define label_admcon1 4 "Do not know", add 
label values admcon1 label_admcon1
label define label_admcon2 -1 "Not reported" 
label define label_admcon2 -2 "Not applicable", add 
label define label_admcon2 1 "Required", add 
label define label_admcon2 2 "Recommended", add 
label define label_admcon2 3 "Neither required nor recommended", add 
label define label_admcon2 4 "Do not know", add 
label values admcon2 label_admcon2
label define label_admcon3 -1 "Not reported" 
label define label_admcon3 -2 "Not applicable", add 
label define label_admcon3 1 "Required", add 
label define label_admcon3 2 "Recommended", add 
label define label_admcon3 3 "Neither required nor recommended", add 
label define label_admcon3 4 "Do not know", add 
label values admcon3 label_admcon3
label define label_admcon4 -1 "Not reported" 
label define label_admcon4 -2 "Not applicable", add 
label define label_admcon4 1 "Required", add 
label define label_admcon4 2 "Recommended", add 
label define label_admcon4 3 "Neither required nor recommended", add 
label define label_admcon4 4 "Do not know", add 
label values admcon4 label_admcon4
label define label_admcon5 -1 "Not reported" 
label define label_admcon5 -2 "Not applicable", add 
label define label_admcon5 1 "Required", add 
label define label_admcon5 2 "Recommended", add 
label define label_admcon5 3 "Neither required nor recommended", add 
label define label_admcon5 4 "Do not know", add 
label values admcon5 label_admcon5
label define label_admcon6 -1 "Not reported" 
label define label_admcon6 -2 "Not applicable", add 
label define label_admcon6 1 "Required", add 
label define label_admcon6 2 "Recommended", add 
label define label_admcon6 3 "Neither required nor recommended", add 
label define label_admcon6 4 "Do not know", add 
label values admcon6 label_admcon6
label define label_admcon7 -1 "Not reported" 
label define label_admcon7 -2 "Not applicable", add 
label define label_admcon7 1 "Required", add 
label define label_admcon7 2 "Recommended", add 
label define label_admcon7 3 "Neither required nor recommended", add 
label define label_admcon7 4 "Do not know", add 
label values admcon7 label_admcon7
label define label_admcon8 -1 "Not reported" 
label define label_admcon8 -2 "Not applicable", add 
label define label_admcon8 1 "Required", add 
label define label_admcon8 2 "Recommended", add 
label define label_admcon8 3 "Neither required nor recommended", add 
label define label_admcon8 4 "Do not know", add 
label values admcon8 label_admcon8
label define label_admcon9 -1 "Not reported" 
label define label_admcon9 -2 "Not applicable", add 
label define label_admcon9 1 "Required", add 
label define label_admcon9 2 "Recommended", add 
label define label_admcon9 3 "Neither required nor recommended", add 
label define label_admcon9 4 "Do not know", add 
label values admcon9 label_admcon9
label define label_appdate -1 "Not reported" 
label define label_appdate -2 "Not applicable", add 
label define label_appdate 1 "Fall 2009", add 
label define label_appdate 2 "Fall 2010", add 
label values appdate label_appdate
label define label_satactdt -1 "Not reported" 
label define label_satactdt -2 "Not applicable", add 
label define label_satactdt 1 "Fall 2009", add 
label define label_satactdt 2 "Fall 2010", add 
label define label_satactdt 3 "Test scores not required", add 
label define label_credits1 -1 "Not reported" 
label define label_credits1 -2 "Not applicable", add 
label define label_credits1 0 "Implied no", add 
label define label_credits1 1 "Yes", add 
label values credits1 label_credits1
label define label_credits2 -1 "Not reported" 
label define label_credits2 -2 "Not applicable", add 
label define label_credits2 0 "Implied no", add 
label define label_credits2 1 "Yes", add 
label values credits2 label_credits2
label define label_credits3 -1 "Not reported" 
label define label_credits3 -2 "Not applicable", add 
label define label_credits3 0 "Implied no", add 
label define label_credits3 1 "Yes", add 
label values credits3 label_credits3
label define label_credits4 -1 "Not reported" 
label define label_credits4 -2 "Not applicable", add 
label define label_credits4 0 "Implied no", add 
label define label_credits4 1 "Yes", add 
label values credits4 label_credits4
label define label_slo3 -1 "Not reported" 
label define label_slo3 -2 "Not applicable", add 
label define label_slo3 0 "Implied no", add 
label define label_slo3 1 "Yes", add 
label values slo3 label_slo3
label define label_slo5 -1 "Not reported" 
label define label_slo5 -2 "Not applicable", add 
label define label_slo5 0 "Implied no", add 
label define label_slo5 1 "Yes", add 
label values slo5 label_slo5
label define label_slo51 -1 "Not reported" 
label define label_slo51 -2 "Not applicable", add 
label define label_slo51 0 "Implied no", add 
label define label_slo51 1 "Yes", add 
label values slo51 label_slo51
label define label_slo52 -1 "Not reported" 
label define label_slo52 -2 "Not applicable", add 
label define label_slo52 0 "Implied no", add 
label define label_slo52 1 "Yes", add 
label values slo52 label_slo52
label define label_slo53 -1 "Not reported" 
label define label_slo53 -2 "Not applicable", add 
label define label_slo53 0 "Implied no", add 
label define label_slo53 1 "Yes", add 
label values slo53 label_slo53
label define label_slo6 -1 "Not reported" 
label define label_slo6 -2 "Not applicable", add 
label define label_slo6 0 "Implied no", add 
label define label_slo6 1 "Yes", add 
label values slo6 label_slo6
label define label_slo7 -1 "Not reported" 
label define label_slo7 -2 "Not applicable", add 
label define label_slo7 0 "Implied no", add 
label define label_slo7 1 "Yes", add 
label values slo7 label_slo7
label define label_slo8 -1 "Not reported" 
label define label_slo8 -2 "Not applicable", add 
label define label_slo8 0 "Implied no", add 
label define label_slo8 1 "Yes", add 
label values slo8 label_slo8
label define label_slo81 -1 "Not reported" 
label define label_slo81 -2 "Not applicable", add 
label define label_slo81 0 "Implied no", add 
label define label_slo81 1 "Yes", add 
label values slo81 label_slo81
label define label_slo82 -1 "Not reported" 
label define label_slo82 -2 "Not applicable", add 
label define label_slo82 0 "Implied no", add 
label define label_slo82 1 "Yes", add 
label values slo82 label_slo82
label define label_slo83 -1 "Not reported" 
label define label_slo83 -2 "Not applicable", add 
label define label_slo83 0 "Implied no", add 
label define label_slo83 1 "Yes", add 
label values slo83 label_slo83
label define label_slo9 -1 "Not reported" 
label define label_slo9 -2 "Not applicable", add 
label define label_slo9 0 "Implied no", add 
label define label_slo9 1 "Yes", add 
label values slo9 label_slo9
label define label_yrscoll -1 "Not reported" 
label define label_yrscoll -2 "Not applicable", add 
label define label_yrscoll 1 "One", add 
label define label_yrscoll 2 "Two", add 
label define label_yrscoll 3 "Three", add 
label define label_yrscoll 4 "Four", add 
label define label_yrscoll 5 "Five", add 
label define label_yrscoll 6 "Six", add 
label define label_yrscoll 7 "Seven", add 
label define label_yrscoll 8 "Eight", add 
label values yrscoll label_yrscoll
label define label_stusrv1 -1 "Not reported" 
label define label_stusrv1 -2 "Not applicable", add 
label define label_stusrv1 0 "Implied no", add 
label define label_stusrv1 1 "Yes", add 
label values stusrv1 label_stusrv1
label define label_stusrv2 -1 "Not reported" 
label define label_stusrv2 -2 "Not applicable", add 
label define label_stusrv2 0 "Implied no", add 
label define label_stusrv2 1 "Yes", add 
label values stusrv2 label_stusrv2
label define label_stusrv3 -1 "Not reported" 
label define label_stusrv3 -2 "Not applicable", add 
label define label_stusrv3 0 "Implied no", add 
label define label_stusrv3 1 "Yes", add 
label values stusrv3 label_stusrv3
label define label_stusrv4 -1 "Not reported" 
label define label_stusrv4 -2 "Not applicable", add 
label define label_stusrv4 0 "Implied no", add 
label define label_stusrv4 1 "Yes", add 
label values stusrv4 label_stusrv4
label define label_stusrv8 -1 "Not reported" 
label define label_stusrv8 -2 "Not applicable", add 
label define label_stusrv8 0 "Implied no", add 
label define label_stusrv8 1 "Yes", add 
label values stusrv8 label_stusrv8
label define label_stusrv9 -1 "Not reported" 
label define label_stusrv9 -2 "Not applicable", add 
label define label_stusrv9 0 "Implied no", add 
label define label_stusrv9 1 "Yes", add 
label values stusrv9 label_stusrv9
label define label_libfac -1 "Not reported" 
label define label_libfac -2 "Not applicable", add 
label define label_libfac 1 "Has own library", add 
label define label_libfac 2 "Shared financial support for library", add 
label define label_libfac 3 "None of the above", add 
label values libfac label_libfac
label define label_athassoc -1 "Not reported" 
label define label_athassoc -2 "Not applicable", add 
label define label_athassoc 1 "Yes", add 
label define label_athassoc 2 "No", add 
label values athassoc label_athassoc
label define label_assoc1 -1 "Not reported" 
label define label_assoc1 -2 "Not applicable", add 
label define label_assoc1 0 "Implied no", add 
label define label_assoc1 1 "Yes", add 
label values assoc1 label_assoc1
label define label_assoc2 -1 "Not reported" 
label define label_assoc2 -2 "Not applicable", add 
label define label_assoc2 0 "Implied no", add 
label define label_assoc2 1 "Yes", add 
label values assoc2 label_assoc2
label define label_assoc3 -1 "Not reported" 
label define label_assoc3 -2 "Not applicable", add 
label define label_assoc3 0 "Implied no", add 
label define label_assoc3 1 "Yes", add 
label values assoc3 label_assoc3
label define label_assoc4 -1 "Not reported" 
label define label_assoc4 -2 "Not applicable", add 
label define label_assoc4 0 "Implied no", add 
label define label_assoc4 1 "Yes", add 
label values assoc4 label_assoc4
label define label_assoc5 -1 "Not reported" 
label define label_assoc5 -2 "Not applicable", add 
label define label_assoc5 0 "Implied no", add 
label define label_assoc5 1 "Yes", add 
label values assoc5 label_assoc5
label define label_assoc6 -1 "Not reported" 
label define label_assoc6 -2 "Not applicable", add 
label define label_assoc6 0 "Implied no", add 
label define label_assoc6 1 "Yes", add 
label values assoc6 label_assoc6
label define label_sport1 -1 "Not reported" 
label define label_sport1 -2 "Not applicable", add 
label define label_sport1 1 "Yes", add 
label define label_sport1 2 "No", add 
label values sport1 label_sport1
label define label_confno1 -1 "Not reported" 
label define label_confno1 -2 "Not applicable", add 
label define label_confno1 101 "America East", add 
label define label_confno1 102 "Atlantic Coast Conference", add 
label define label_confno1 103 "Atlantic 10 Conference", add 
label define label_confno1 104 "Big East Conference", add 
label define label_confno1 105 "Big Sky Conference", add 
label define label_confno1 106 "Big South Conference", add 
label define label_confno1 107 "Big Ten Conference", add 
label define label_confno1 108 "Big Twelve Conference", add 
label define label_confno1 109 "Big West Conference", add 
label define label_confno1 110 "Colonial Athletic Association", add 
label define label_confno1 111 "Conference USA", add 
label define label_confno1 112 "Division I Independents", add 
label define label_confno1 113 "Division I-A Independents", add 
label define label_confno1 114 "Division I-AA Independents", add 
label define label_confno1 115 "Eastern College Athletic Conference", add 
label define label_confno1 116 "Gateway Football Conference", add 
label define label_confno1 117 "Ivy Group", add 
label define label_confno1 118 "Metro Atlantic Athletic Conference", add 
label define label_confno1 119 "Mid-American Conference", add 
label define label_confno1 120 "The Summit League", add 
label define label_confno1 121 "Mid-Eastern Athletic Conference", add 
label define label_confno1 122 "Horizon League", add 
label define label_confno1 123 "Missouri Valley Conference", add 
label define label_confno1 124 "Mountain Pacific Sports Federation", add 
label define label_confno1 125 "Northeast Conference", add 
label define label_confno1 126 "Ohio Valley Conference", add 
label define label_confno1 127 "Pacific-10 Conference", add 
label define label_confno1 128 "Patriot League", add 
label define label_confno1 129 "Pioneer Football League", add 
label define label_confno1 130 "Southeastern Conference", add 
label define label_confno1 131 "Southern Conference", add 
label define label_confno1 132 "Southland Conference", add 
label define label_confno1 133 "Southwestern Athletic Conference", add 
label define label_confno1 134 "Sun Belt Conference", add 
label define label_confno1 135 "Atlantic Sun Conference", add 
label define label_confno1 136 "West Coast Conference", add 
label define label_confno1 137 "Western Athletic Conference", add 
label define label_confno1 138 "California Collegiate Athletic Assoc", add 
label define label_confno1 139 "Conference Carolinas", add 
label define label_confno1 140 "Central Intercollegiate Athletic Assoc", add 
label define label_confno1 141 "Division II Independents", add 
label define label_confno1 144 "Great Lakes Intercollegiate Ath Conf", add 
label define label_confno1 145 "Great Lakes Valley Conference", add 
label define label_confno1 146 "Gulf South Conference", add 
label define label_confno1 147 "Lone Star Conference", add 
label define label_confno1 148 "Mid-America Intercollegiate Ath Assoc", add 
label define label_confno1 151 "East Coast Conference", add 
label define label_confno1 152 "North Central Intercollegiate Athletic Conf", add 
label define label_confno1 153 "Northeast 10 Conference", add 
label define label_confno1 155 "Northern Sun Intercollegiate Conference", add 
label define label_confno1 156 "Pacific West Conference", add 
label define label_confno1 157 "Peach Belt Conference", add 
label define label_confno1 158 "Pennsylvania State Athletic Conference", add 
label define label_confno1 159 "Rocky Mountain Athletic Conference", add 
label define label_confno1 160 "South Atlantic Conference", add 
label define label_confno1 161 "Southern Intercollegiate Athletic Conf", add 
label define label_confno1 162 "Sunshine State Conference", add 
label define label_confno1 163 "West Virginia Intercollegiate Athletic Conf", add 
label define label_confno1 164 "Capital Athletic Conference", add 
label define label_confno1 165 "Centennial Conference", add 
label define label_confno1 166 "City University of New York Ath Conf", add 
label define label_confno1 167 "College Conference of Illinois and Wisc", add 
label define label_confno1 168 "Commonwealth Coast Conference", add 
label define label_confno1 170 "Division III Independents", add 
label define label_confno1 171 "USA South Athletic Conference", add 
label define label_confno1 172 "Empire Eight", add 
label define label_confno1 173 "Freedom Football Conference", add 
label define label_confno1 174 "Great Northeast Athletic Conference", add 
label define label_confno1 175 "Heartland Collegiate Athletic Conference", add 
label define label_confno1 176 "Iowa Intercollegiate Athletic Conf", add 
label define label_confno1 177 "Lake Michigan Conference", add 
label define label_confno1 178 "Little East Conference", add 
label define label_confno1 179 "Massachusetts State College Ath Assoc", add 
label define label_confno1 180 "Michigan Intercollegiate Athletic Assoc", add 
label define label_confno1 181 "Middle Atlantic States Athletic Corporation", add 
label define label_confno1 182 "Midwest Conference", add 
label define label_confno1 183 "Minnesota Intercollegiate Ath Conf", add 
label define label_confno1 184 "New England Football Conference", add 
label define label_confno1 185 "New England Small College Ath Conf", add 
label define label_confno1 186 "New England Womens & Mens Athletic Conference", add 
label define label_confno1 187 "New Jersey Athletic Conference", add 
label define label_confno1 188 "New York State Womens Coll Ath Assoc", add 
label define label_confno1 189 "North Coast Athletic Conference", add 
label define label_confno1 190 "Northern Illinois-Iowa Conference", add 
label define label_confno1 191 "Ohio Athletic Conference", add 
label define label_confno1 192 "Old Dominion Athletic Conference", add 
label define label_confno1 193 "Pennsylvania Athletic Conference", add 
label define label_confno1 194 "Presidents Athletic Conference", add 
label define label_confno1 195 "St. Louis Intercollegiate Ath Conf", add 
label define label_confno1 196 "Skyline Conference", add 
label define label_confno1 197 "Southern California Intercoll Ath Conf", add 
label define label_confno1 198 "Southern Collegiate Athletic Conference", add 
label define label_confno1 199 "State University of New York Ath Conf", add 
label define label_confno1 200 "University Athletic Association", add 
label define label_confno1 201 "Upstate Collegiate Athletic Association", add 
label define label_confno1 202 "Wisconsin Intercollegiate Ath Conf", add 
label define label_confno1 203 "Mountain West Conference", add 
label define label_confno1 204 "American Southwest Conference", add 
label define label_confno1 205 "Northwest Conference", add 
label define label_confno1 206 "Atlantic Womens Colleges Conference", add 
label define label_confno1 207 "Commonwealth Conference", add 
label define label_confno1 208 "Freedom Conference", add 
label define label_confno1 209 "Heartland Conference", add 
label define label_confno1 210 "Illini-Badger Intercollegiate Football Conference", add 
label define label_confno1 211 "Knickerbocker Baseball Conference", add 
label define label_confno1 212 "Pilgrim League", add 
label define label_confno1 213 "Great Northwest Athletic Conference", add 
label define label_confno1 214 "Allegheny Mountain Collegiate Conference", add 
label define label_confno1 215 "North Atlantic Conference", add 
label define label_confno1 301 "California Pacific Conference", add 
label define label_confno1 302 "Golden State Athletic Conference", add 
label define label_confno1 303 "Independent Far West Region", add 
label define label_confno1 304 "Chicagoland Collegiate Athletic Conf", add 
label define label_confno1 305 "Mid-Central College Conference", add 
label define label_confno1 306 "American Mideast Conference", add 
label define label_confno1 307 "Wolverine-Hoosier Athletic Conf", add 
label define label_confno1 308 "Independent Great Lakes Region", add 
label define label_confno1 309 "Kansas Collegiate Athletic Conf", add 
label define label_confno1 310 "Midlands Collegiate Athletic Conf", add 
label define label_confno1 311 "Great Plains Athletic Conference", add 
label define label_confno1 314 "Kentucky Intercollegiate Ath Conf", add 
label define label_confno1 315 "Mid-South Conference", add 
label define label_confno1 316 "Appalachian Athletic Conference", add 
label define label_confno1 317 "TranSouth Athletic Conference", add 
label define label_confno1 318 "Independent Mid-South Region", add 
label define label_confno1 319 "American Midwest Conference", add 
label define label_confno1 320 "Heart of America Athletic Conference", add 
label define label_confno1 321 "Midwest Classic Conference", add 
label define label_confno1 322 "Independent Midwest Region", add 
label define label_confno1 323 "Central Atlantic Collegiate Conf", add 
label define label_confno1 327 "Independent Northeast Region", add 
label define label_confno1 328 "Cascade Collegiate Conference", add 
label define label_confno1 331 "Independent Pacific Northwest Region", add 
label define label_confno1 332 "Eastern Intercollegiate Athletic Conf", add 
label define label_confno1 333 "Florida Sun Conference", add 
label define label_confno1 334 "Southern States Athletic Conference", add 
label define label_confno1 335 "Independent Southeast Region", add 
label define label_confno1 337 "Gulf Coast Athletic Conference", add 
label define label_confno1 340 "Sooner Athletic Conference", add 
label define label_confno1 341 "Independent Southwest Region", add 
label define label_confno1 342 "Other", add 
label define label_confno1 351 "Dakota Athletic Conference", add 
label define label_confno1 352 "Frontier Conference", add 
label define label_confno1 353 "Red River Athletic Conference", add 
label define label_confno1 354 "Upper Midwest Athletic Conference", add 
label define label_confno1 355 "Central States Football League", add 
label define label_confno1 356 "Mid-States Football Association", add 
label define label_confno1 357 "Sunrise Conference", add 
label define label_confno1 359 "Northern Athletics Conference", add 
label define label_confno1 360 "Great South Athletic Conference", add 
label define label_confno1 361 "Landmark Conference", add 
label define label_confno1 362 "Great West Conference", add 
label define label_confno1 363 "New England Collegiate Conference", add 
label define label_confno1 364 "Colonial States Athletic Conference", add 
label define label_confno1 365 "North Eastern Athletic Conference", add 
label define label_confno1 366 "Eastern Collegiate Football Conference", add 
label values confno1 label_confno1
label define label_sport2 -1 "Not reported" 
label define label_sport2 -2 "Not applicable", add 
label define label_sport2 1 "Yes", add 
label define label_sport2 2 "No", add 
label values sport2 label_sport2
label define label_confno2 -1 "Not reported" 
label define label_confno2 -2 "Not applicable", add 
label define label_confno2 101 "America East", add 
label define label_confno2 102 "Atlantic Coast Conference", add 
label define label_confno2 103 "Atlantic 10 Conference", add 
label define label_confno2 104 "Big East Conference", add 
label define label_confno2 105 "Big Sky Conference", add 
label define label_confno2 106 "Big South Conference", add 
label define label_confno2 107 "Big Ten Conference", add 
label define label_confno2 108 "Big Twelve Conference", add 
label define label_confno2 109 "Big West Conference", add 
label define label_confno2 110 "Colonial Athletic Association", add 
label define label_confno2 111 "Conference USA", add 
label define label_confno2 112 "Division I Independents", add 
label define label_confno2 113 "Division I-A Independents", add 
label define label_confno2 114 "Division I-AA Independents", add 
label define label_confno2 115 "Eastern College Athletic Conference", add 
label define label_confno2 116 "Gateway Football Conference", add 
label define label_confno2 117 "Ivy Group", add 
label define label_confno2 118 "Metro Atlantic Athletic Conference", add 
label define label_confno2 119 "Mid-American Conference", add 
label define label_confno2 120 "The Summit League", add 
label define label_confno2 121 "Mid-Eastern Athletic Conference", add 
label define label_confno2 122 "Horizon League", add 
label define label_confno2 123 "Missouri Valley Conference", add 
label define label_confno2 124 "Mountain Pacific Sports Federation", add 
label define label_confno2 125 "Northeast Conference", add 
label define label_confno2 126 "Ohio Valley Conference", add 
label define label_confno2 127 "Pacific-10 Conference", add 
label define label_confno2 128 "Patriot League", add 
label define label_confno2 129 "Pioneer Football League", add 
label define label_confno2 130 "Southeastern Conference", add 
label define label_confno2 131 "Southern Conference", add 
label define label_confno2 132 "Southland Conference", add 
label define label_confno2 133 "Southwestern Athletic Conference", add 
label define label_confno2 134 "Sun Belt Conference", add 
label define label_confno2 135 "Atlantic Sun Conference", add 
label define label_confno2 136 "West Coast Conference", add 
label define label_confno2 137 "Western Athletic Conference", add 
label define label_confno2 138 "California Collegiate Athletic Assoc", add 
label define label_confno2 139 "Conference Carolinas", add 
label define label_confno2 140 "Central Intercollegiate Athletic Assoc", add 
label define label_confno2 141 "Division II Independents", add 
label define label_confno2 144 "Great Lakes Intercollegiate Ath Conf", add 
label define label_confno2 145 "Great Lakes Valley Conference", add 
label define label_confno2 146 "Gulf South Conference", add 
label define label_confno2 147 "Lone Star Conference", add 
label define label_confno2 148 "Mid-America Intercollegiate Ath Assoc", add 
label define label_confno2 151 "East Coast Conference", add 
label define label_confno2 152 "North Central Intercollegiate Athletic Conf", add 
label define label_confno2 153 "Northeast 10 Conference", add 
label define label_confno2 155 "Northern Sun Intercollegiate Conference", add 
label define label_confno2 156 "Pacific West Conference", add 
label define label_confno2 157 "Peach Belt Conference", add 
label define label_confno2 158 "Pennsylvania State Athletic Conference", add 
label define label_confno2 159 "Rocky Mountain Athletic Conference", add 
label define label_confno2 160 "South Atlantic Conference", add 
label define label_confno2 161 "Southern Intercollegiate Athletic Conf", add 
label define label_confno2 162 "Sunshine State Conference", add 
label define label_confno2 163 "West Virginia Intercollegiate Athletic Conf", add 
label define label_confno2 164 "Capital Athletic Conference", add 
label define label_confno2 165 "Centennial Conference", add 
label define label_confno2 166 "City University of New York Ath Conf", add 
label define label_confno2 167 "College Conference of Illinois and Wisc", add 
label define label_confno2 168 "Commonwealth Coast Conference", add 
label define label_confno2 170 "Division III Independents", add 
label define label_confno2 171 "USA South Athletic Conference", add 
label define label_confno2 172 "Empire Eight", add 
label define label_confno2 173 "Freedom Football Conference", add 
label define label_confno2 174 "Great Northeast Athletic Conference", add 
label define label_confno2 175 "Heartland Collegiate Athletic Conference", add 
label define label_confno2 176 "Iowa Intercollegiate Athletic Conf", add 
label define label_confno2 177 "Lake Michigan Conference", add 
label define label_confno2 178 "Little East Conference", add 
label define label_confno2 179 "Massachusetts State College Ath Assoc", add 
label define label_confno2 180 "Michigan Intercollegiate Athletic Assoc", add 
label define label_confno2 181 "Middle Atlantic States Athletic Corporation", add 
label define label_confno2 182 "Midwest Conference", add 
label define label_confno2 183 "Minnesota Intercollegiate Ath Conf", add 
label define label_confno2 184 "New England Football Conference", add 
label define label_confno2 185 "New England Small College Ath Conf", add 
label define label_confno2 186 "New England Womens & Mens Athletic Conference", add 
label define label_confno2 187 "New Jersey Athletic Conference", add 
label define label_confno2 188 "New York State Womens Coll Ath Assoc", add 
label define label_confno2 189 "North Coast Athletic Conference", add 
label define label_confno2 190 "Northern Illinois-Iowa Conference", add 
label define label_confno2 191 "Ohio Athletic Conference", add 
label define label_confno2 192 "Old Dominion Athletic Conference", add 
label define label_confno2 193 "Pennsylvania Athletic Conference", add 
label define label_confno2 194 "Presidents Athletic Conference", add 
label define label_confno2 195 "St. Louis Intercollegiate Ath Conf", add 
label define label_confno2 196 "Skyline Conference", add 
label define label_confno2 197 "Southern California Intercoll Ath Conf", add 
label define label_confno2 198 "Southern Collegiate Athletic Conference", add 
label define label_confno2 199 "State University of New York Ath Conf", add 
label define label_confno2 200 "University Athletic Association", add 
label define label_confno2 201 "Upstate Collegiate Athletic Association", add 
label define label_confno2 202 "Wisconsin Intercollegiate Ath Conf", add 
label define label_confno2 203 "Mountain West Conference", add 
label define label_confno2 204 "American Southwest Conference", add 
label define label_confno2 205 "Northwest Conference", add 
label define label_confno2 206 "Atlantic Womens Colleges Conference", add 
label define label_confno2 207 "Commonwealth Conference", add 
label define label_confno2 208 "Freedom Conference", add 
label define label_confno2 209 "Heartland Conference", add 
label define label_confno2 210 "Illini-Badger Intercollegiate Football Conference", add 
label define label_confno2 211 "Knickerbocker Baseball Conference", add 
label define label_confno2 212 "Pilgrim League", add 
label define label_confno2 213 "Great Northwest Athletic Conference", add 
label define label_confno2 214 "Allegheny Mountain Collegiate Conference", add 
label define label_confno2 215 "North Atlantic Conference", add 
label define label_confno2 301 "California Pacific Conference", add 
label define label_confno2 302 "Golden State Athletic Conference", add 
label define label_confno2 303 "Independent Far West Region", add 
label define label_confno2 304 "Chicagoland Collegiate Athletic Conf", add 
label define label_confno2 305 "Mid-Central College Conference", add 
label define label_confno2 306 "American Mideast Conference", add 
label define label_confno2 307 "Wolverine-Hoosier Athletic Conf", add 
label define label_confno2 308 "Independent Great Lakes Region", add 
label define label_confno2 309 "Kansas Collegiate Athletic Conf", add 
label define label_confno2 310 "Midlands Collegiate Athletic Conf", add 
label define label_confno2 311 "Great Plains Athletic Conference", add 
label define label_confno2 314 "Kentucky Intercollegiate Ath Conf", add 
label define label_confno2 315 "Mid-South Conference", add 
label define label_confno2 316 "Appalachian Athletic Conference", add 
label define label_confno2 317 "TranSouth Athletic Conference", add 
label define label_confno2 318 "Independent Mid-South Region", add 
label define label_confno2 319 "American Midwest Conference", add 
label define label_confno2 320 "Heart of America Athletic Conference", add 
label define label_confno2 321 "Midwest Classic Conference", add 
label define label_confno2 322 "Independent Midwest Region", add 
label define label_confno2 323 "Central Atlantic Collegiate Conf", add 
label define label_confno2 327 "Independent Northeast Region", add 
label define label_confno2 328 "Cascade Collegiate Conference", add 
label define label_confno2 331 "Independent Pacific Northwest Region", add 
label define label_confno2 332 "Eastern Intercollegiate Athletic Conf", add 
label define label_confno2 333 "Florida Sun Conference", add 
label define label_confno2 334 "Southern States Athletic Conference", add 
label define label_confno2 335 "Independent Southeast Region", add 
label define label_confno2 337 "Gulf Coast Athletic Conference", add 
label define label_confno2 340 "Sooner Athletic Conference", add 
label define label_confno2 341 "Independent Southwest Region", add 
label define label_confno2 342 "Other", add 
label define label_confno2 351 "Dakota Athletic Conference", add 
label define label_confno2 352 "Frontier Conference", add 
label define label_confno2 353 "Red River Athletic Conference", add 
label define label_confno2 354 "Upper Midwest Athletic Conference", add 
label define label_confno2 355 "Central States Football League", add 
label define label_confno2 356 "Mid-States Football Association", add 
label define label_confno2 357 "Sunrise Conference", add 
label define label_confno2 359 "Northern Athletics Conference", add 
label define label_confno2 360 "Great South Athletic Conference", add 
label define label_confno2 361 "Landmark Conference", add 
label define label_confno2 362 "Great West Conference", add 
label define label_confno2 363 "New England Collegiate Conference", add 
label define label_confno2 364 "Colonial States Athletic Conference", add 
label define label_confno2 365 "North Eastern Athletic Conference", add 
label values confno2 label_confno2
label define label_sport3 -1 "Not reported" 
label define label_sport3 -2 "Not applicable", add 
label define label_sport3 1 "Yes", add 
label define label_sport3 2 "No", add 
label values sport3 label_sport3
label define label_confno3 -1 "Not reported" 
label define label_confno3 -2 "Not applicable", add 
label define label_confno3 101 "America East", add 
label define label_confno3 102 "Atlantic Coast Conference", add 
label define label_confno3 103 "Atlantic 10 Conference", add 
label define label_confno3 104 "Big East Conference", add 
label define label_confno3 105 "Big Sky Conference", add 
label define label_confno3 106 "Big South Conference", add 
label define label_confno3 107 "Big Ten Conference", add 
label define label_confno3 108 "Big Twelve Conference", add 
label define label_confno3 109 "Big West Conference", add 
label define label_confno3 110 "Colonial Athletic Association", add 
label define label_confno3 111 "Conference USA", add 
label define label_confno3 112 "Division I Independents", add 
label define label_confno3 113 "Division I-A Independents", add 
label define label_confno3 114 "Division I-AA Independents", add 
label define label_confno3 115 "Eastern College Athletic Conference", add 
label define label_confno3 116 "Gateway Football Conference", add 
label define label_confno3 117 "Ivy Group", add 
label define label_confno3 118 "Metro Atlantic Athletic Conference", add 
label define label_confno3 119 "Mid-American Conference", add 
label define label_confno3 120 "The Summit League", add 
label define label_confno3 121 "Mid-Eastern Athletic Conference", add 
label define label_confno3 122 "Horizon League", add 
label define label_confno3 123 "Missouri Valley Conference", add 
label define label_confno3 124 "Mountain Pacific Sports Federation", add 
label define label_confno3 125 "Northeast Conference", add 
label define label_confno3 126 "Ohio Valley Conference", add 
label define label_confno3 127 "Pacific-10 Conference", add 
label define label_confno3 128 "Patriot League", add 
label define label_confno3 129 "Pioneer Football League", add 
label define label_confno3 130 "Southeastern Conference", add 
label define label_confno3 131 "Southern Conference", add 
label define label_confno3 132 "Southland Conference", add 
label define label_confno3 133 "Southwestern Athletic Conference", add 
label define label_confno3 134 "Sun Belt Conference", add 
label define label_confno3 135 "Atlantic Sun Conference", add 
label define label_confno3 136 "West Coast Conference", add 
label define label_confno3 137 "Western Athletic Conference", add 
label define label_confno3 138 "California Collegiate Athletic Assoc", add 
label define label_confno3 139 "Conference Carolinas", add 
label define label_confno3 140 "Central Intercollegiate Athletic Assoc", add 
label define label_confno3 141 "Division II Independents", add 
label define label_confno3 144 "Great Lakes Intercollegiate Ath Conf", add 
label define label_confno3 145 "Great Lakes Valley Conference", add 
label define label_confno3 146 "Gulf South Conference", add 
label define label_confno3 147 "Lone Star Conference", add 
label define label_confno3 148 "Mid-America Intercollegiate Ath Assoc", add 
label define label_confno3 151 "East Coast Conference", add 
label define label_confno3 152 "North Central Intercollegiate Athletic Conf", add 
label define label_confno3 153 "Northeast 10 Conference", add 
label define label_confno3 155 "Northern Sun Intercollegiate Conference", add 
label define label_confno3 156 "Pacific West Conference", add 
label define label_confno3 157 "Peach Belt Conference", add 
label define label_confno3 158 "Pennsylvania State Athletic Conference", add 
label define label_confno3 159 "Rocky Mountain Athletic Conference", add 
label define label_confno3 160 "South Atlantic Conference", add 
label define label_confno3 161 "Southern Intercollegiate Athletic Conf", add 
label define label_confno3 162 "Sunshine State Conference", add 
label define label_confno3 163 "West Virginia Intercollegiate Athletic Conf", add 
label define label_confno3 164 "Capital Athletic Conference", add 
label define label_confno3 165 "Centennial Conference", add 
label define label_confno3 166 "City University of New York Ath Conf", add 
label define label_confno3 167 "College Conference of Illinois and Wisc", add 
label define label_confno3 168 "Commonwealth Coast Conference", add 
label define label_confno3 170 "Division III Independents", add 
label define label_confno3 171 "USA South Athletic Conference", add 
label define label_confno3 172 "Empire Eight", add 
label define label_confno3 173 "Freedom Football Conference", add 
label define label_confno3 174 "Great Northeast Athletic Conference", add 
label define label_confno3 175 "Heartland Collegiate Athletic Conference", add 
label define label_confno3 176 "Iowa Intercollegiate Athletic Conf", add 
label define label_confno3 177 "Lake Michigan Conference", add 
label define label_confno3 178 "Little East Conference", add 
label define label_confno3 179 "Massachusetts State College Ath Assoc", add 
label define label_confno3 180 "Michigan Intercollegiate Athletic Assoc", add 
label define label_confno3 181 "Middle Atlantic States Athletic Corporation", add 
label define label_confno3 182 "Midwest Conference", add 
label define label_confno3 183 "Minnesota Intercollegiate Ath Conf", add 
label define label_confno3 184 "New England Football Conference", add 
label define label_confno3 185 "New England Small College Ath Conf", add 
label define label_confno3 186 "New England Womens & Mens Athletic Conference", add 
label define label_confno3 187 "New Jersey Athletic Conference", add 
label define label_confno3 188 "New York State Womens Coll Ath Assoc", add 
label define label_confno3 189 "North Coast Athletic Conference", add 
label define label_confno3 190 "Northern Illinois-Iowa Conference", add 
label define label_confno3 191 "Ohio Athletic Conference", add 
label define label_confno3 192 "Old Dominion Athletic Conference", add 
label define label_confno3 193 "Pennsylvania Athletic Conference", add 
label define label_confno3 194 "Presidents Athletic Conference", add 
label define label_confno3 195 "St. Louis Intercollegiate Ath Conf", add 
label define label_confno3 196 "Skyline Conference", add 
label define label_confno3 197 "Southern California Intercoll Ath Conf", add 
label define label_confno3 198 "Southern Collegiate Athletic Conference", add 
label define label_confno3 199 "State University of New York Ath Conf", add 
label define label_confno3 200 "University Athletic Association", add 
label define label_confno3 201 "Upstate Collegiate Athletic Association", add 
label define label_confno3 202 "Wisconsin Intercollegiate Ath Conf", add 
label define label_confno3 203 "Mountain West Conference", add 
label define label_confno3 204 "American Southwest Conference", add 
label define label_confno3 205 "Northwest Conference", add 
label define label_confno3 206 "Atlantic Womens Colleges Conference", add 
label define label_confno3 207 "Commonwealth Conference", add 
label define label_confno3 208 "Freedom Conference", add 
label define label_confno3 209 "Heartland Conference", add 
label define label_confno3 210 "Illini-Badger Intercollegiate Football Conference", add 
label define label_confno3 211 "Knickerbocker Baseball Conference", add 
label define label_confno3 212 "Pilgrim League", add 
label define label_confno3 213 "Great Northwest Athletic Conference", add 
label define label_confno3 214 "Allegheny Mountain Collegiate Conference", add 
label define label_confno3 215 "North Atlantic Conference", add 
label define label_confno3 301 "California Pacific Conference", add 
label define label_confno3 302 "Golden State Athletic Conference", add 
label define label_confno3 303 "Independent Far West Region", add 
label define label_confno3 304 "Chicagoland Collegiate Athletic Conf", add 
label define label_confno3 305 "Mid-Central College Conference", add 
label define label_confno3 306 "American Mideast Conference", add 
label define label_confno3 307 "Wolverine-Hoosier Athletic Conf", add 
label define label_confno3 308 "Independent Great Lakes Region", add 
label define label_confno3 309 "Kansas Collegiate Athletic Conf", add 
label define label_confno3 310 "Midlands Collegiate Athletic Conf", add 
label define label_confno3 311 "Great Plains Athletic Conference", add 
label define label_confno3 314 "Kentucky Intercollegiate Ath Conf", add 
label define label_confno3 315 "Mid-South Conference", add 
label define label_confno3 316 "Appalachian Athletic Conference", add 
label define label_confno3 317 "TranSouth Athletic Conference", add 
label define label_confno3 318 "Independent Mid-South Region", add 
label define label_confno3 319 "American Midwest Conference", add 
label define label_confno3 320 "Heart of America Athletic Conference", add 
label define label_confno3 321 "Midwest Classic Conference", add 
label define label_confno3 322 "Independent Midwest Region", add 
label define label_confno3 323 "Central Atlantic Collegiate Conf", add 
label define label_confno3 327 "Independent Northeast Region", add 
label define label_confno3 328 "Cascade Collegiate Conference", add 
label define label_confno3 331 "Independent Pacific Northwest Region", add 
label define label_confno3 332 "Eastern Intercollegiate Athletic Conf", add 
label define label_confno3 333 "Florida Sun Conference", add 
label define label_confno3 334 "Southern States Athletic Conference", add 
label define label_confno3 335 "Independent Southeast Region", add 
label define label_confno3 337 "Gulf Coast Athletic Conference", add 
label define label_confno3 340 "Sooner Athletic Conference", add 
label define label_confno3 341 "Independent Southwest Region", add 
label define label_confno3 342 "Other", add 
label define label_confno3 351 "Dakota Athletic Conference", add 
label define label_confno3 352 "Frontier Conference", add 
label define label_confno3 353 "Red River Athletic Conference", add 
label define label_confno3 354 "Upper Midwest Athletic Conference", add 
label define label_confno3 355 "Central States Football League", add 
label define label_confno3 356 "Mid-States Football Association", add 
label define label_confno3 357 "Sunrise Conference", add 
label define label_confno3 359 "Northern Athletics Conference", add 
label define label_confno3 360 "Great South Athletic Conference", add 
label define label_confno3 361 "Landmark Conference", add 
label define label_confno3 362 "Great West Conference", add 
label define label_confno3 363 "New England Collegiate Conference", add 
label define label_confno3 364 "Colonial States Athletic Conference", add 
label define label_confno3 365 "North Eastern Athletic Conference", add 
label values confno3 label_confno3
label define label_sport4 -1 "Not reported" 
label define label_sport4 -2 "Not applicable", add 
label define label_sport4 1 "Yes", add 
label define label_sport4 2 "No", add 
label values sport4 label_sport4
label define label_confno4 -1 "Not reported" 
label define label_confno4 -2 "Not applicable", add 
label define label_confno4 101 "America East", add 
label define label_confno4 102 "Atlantic Coast Conference", add 
label define label_confno4 103 "Atlantic 10 Conference", add 
label define label_confno4 104 "Big East Conference", add 
label define label_confno4 105 "Big Sky Conference", add 
label define label_confno4 106 "Big South Conference", add 
label define label_confno4 107 "Big Ten Conference", add 
label define label_confno4 108 "Big Twelve Conference", add 
label define label_confno4 109 "Big West Conference", add 
label define label_confno4 110 "Colonial Athletic Association", add 
label define label_confno4 111 "Conference USA", add 
label define label_confno4 112 "Division I Independents", add 
label define label_confno4 113 "Division I-A Independents", add 
label define label_confno4 114 "Division I-AA Independents", add 
label define label_confno4 115 "Eastern College Athletic Conference", add 
label define label_confno4 116 "Gateway Football Conference", add 
label define label_confno4 117 "Ivy Group", add 
label define label_confno4 118 "Metro Atlantic Athletic Conference", add 
label define label_confno4 119 "Mid-American Conference", add 
label define label_confno4 120 "The Summit League", add 
label define label_confno4 121 "Mid-Eastern Athletic Conference", add 
label define label_confno4 122 "Horizon League", add 
label define label_confno4 123 "Missouri Valley Conference", add 
label define label_confno4 124 "Mountain Pacific Sports Federation", add 
label define label_confno4 125 "Northeast Conference", add 
label define label_confno4 126 "Ohio Valley Conference", add 
label define label_confno4 127 "Pacific-10 Conference", add 
label define label_confno4 128 "Patriot League", add 
label define label_confno4 129 "Pioneer Football League", add 
label define label_confno4 130 "Southeastern Conference", add 
label define label_confno4 131 "Southern Conference", add 
label define label_confno4 132 "Southland Conference", add 
label define label_confno4 133 "Southwestern Athletic Conference", add 
label define label_confno4 134 "Sun Belt Conference", add 
label define label_confno4 135 "Atlantic Sun Conference", add 
label define label_confno4 136 "West Coast Conference", add 
label define label_confno4 137 "Western Athletic Conference", add 
label define label_confno4 138 "California Collegiate Athletic Assoc", add 
label define label_confno4 139 "Conference Carolinas", add 
label define label_confno4 140 "Central Intercollegiate Athletic Assoc", add 
label define label_confno4 141 "Division II Independents", add 
label define label_confno4 144 "Great Lakes Intercollegiate Ath Conf", add 
label define label_confno4 145 "Great Lakes Valley Conference", add 
label define label_confno4 146 "Gulf South Conference", add 
label define label_confno4 147 "Lone Star Conference", add 
label define label_confno4 148 "Mid-America Intercollegiate Ath Assoc", add 
label define label_confno4 151 "East Coast Conference", add 
label define label_confno4 152 "North Central Intercollegiate Athletic Conf", add 
label define label_confno4 153 "Northeast 10 Conference", add 
label define label_confno4 155 "Northern Sun Intercollegiate Conference", add 
label define label_confno4 156 "Pacific West Conference", add 
label define label_confno4 157 "Peach Belt Conference", add 
label define label_confno4 158 "Pennsylvania State Athletic Conference", add 
label define label_confno4 159 "Rocky Mountain Athletic Conference", add 
label define label_confno4 160 "South Atlantic Conference", add 
label define label_confno4 161 "Southern Intercollegiate Athletic Conf", add 
label define label_confno4 162 "Sunshine State Conference", add 
label define label_confno4 163 "West Virginia Intercollegiate Athletic Conf", add 
label define label_confno4 164 "Capital Athletic Conference", add 
label define label_confno4 165 "Centennial Conference", add 
label define label_confno4 166 "City University of New York Ath Conf", add 
label define label_confno4 167 "College Conference of Illinois and Wisc", add 
label define label_confno4 168 "Commonwealth Coast Conference", add 
label define label_confno4 170 "Division III Independents", add 
label define label_confno4 171 "USA South Athletic Conference", add 
label define label_confno4 172 "Empire Eight", add 
label define label_confno4 173 "Freedom Football Conference", add 
label define label_confno4 174 "Great Northeast Athletic Conference", add 
label define label_confno4 175 "Heartland Collegiate Athletic Conference", add 
label define label_confno4 176 "Iowa Intercollegiate Athletic Conf", add 
label define label_confno4 177 "Lake Michigan Conference", add 
label define label_confno4 178 "Little East Conference", add 
label define label_confno4 179 "Massachusetts State College Ath Assoc", add 
label define label_confno4 180 "Michigan Intercollegiate Athletic Assoc", add 
label define label_confno4 181 "Middle Atlantic States Athletic Corporation", add 
label define label_confno4 182 "Midwest Conference", add 
label define label_confno4 183 "Minnesota Intercollegiate Ath Conf", add 
label define label_confno4 184 "New England Football Conference", add 
label define label_confno4 185 "New England Small College Ath Conf", add 
label define label_confno4 186 "New England Womens & Mens Athletic Conference", add 
label define label_confno4 187 "New Jersey Athletic Conference", add 
label define label_confno4 188 "New York State Womens Coll Ath Assoc", add 
label define label_confno4 189 "North Coast Athletic Conference", add 
label define label_confno4 190 "Northern Illinois-Iowa Conference", add 
label define label_confno4 191 "Ohio Athletic Conference", add 
label define label_confno4 192 "Old Dominion Athletic Conference", add 
label define label_confno4 193 "Pennsylvania Athletic Conference", add 
label define label_confno4 194 "Presidents Athletic Conference", add 
label define label_confno4 195 "St. Louis Intercollegiate Ath Conf", add 
label define label_confno4 196 "Skyline Conference", add 
label define label_confno4 197 "Southern California Intercoll Ath Conf", add 
label define label_confno4 198 "Southern Collegiate Athletic Conference", add 
label define label_confno4 199 "State University of New York Ath Conf", add 
label define label_confno4 200 "University Athletic Association", add 
label define label_confno4 201 "Upstate Collegiate Athletic Association", add 
label define label_confno4 202 "Wisconsin Intercollegiate Ath Conf", add 
label define label_confno4 203 "Mountain West Conference", add 
label define label_confno4 204 "American Southwest Conference", add 
label define label_confno4 205 "Northwest Conference", add 
label define label_confno4 206 "Atlantic Womens Colleges Conference", add 
label define label_confno4 207 "Commonwealth Conference", add 
label define label_confno4 208 "Freedom Conference", add 
label define label_confno4 209 "Heartland Conference", add 
label define label_confno4 210 "Illini-Badger Intercollegiate Football Conference", add 
label define label_confno4 211 "Knickerbocker Baseball Conference", add 
label define label_confno4 212 "Pilgrim League", add 
label define label_confno4 213 "Great Northwest Athletic Conference", add 
label define label_confno4 214 "Allegheny Mountain Collegiate Conference", add 
label define label_confno4 215 "North Atlantic Conference", add 
label define label_confno4 301 "California Pacific Conference", add 
label define label_confno4 302 "Golden State Athletic Conference", add 
label define label_confno4 303 "Independent Far West Region", add 
label define label_confno4 304 "Chicagoland Collegiate Athletic Conf", add 
label define label_confno4 305 "Mid-Central College Conference", add 
label define label_confno4 306 "American Mideast Conference", add 
label define label_confno4 307 "Wolverine-Hoosier Athletic Conf", add 
label define label_confno4 308 "Independent Great Lakes Region", add 
label define label_confno4 309 "Kansas Collegiate Athletic Conf", add 
label define label_confno4 310 "Midlands Collegiate Athletic Conf", add 
label define label_confno4 311 "Great Plains Athletic Conference", add 
label define label_confno4 314 "Kentucky Intercollegiate Ath Conf", add 
label define label_confno4 315 "Mid-South Conference", add 
label define label_confno4 316 "Appalachian Athletic Conference", add 
label define label_confno4 317 "TranSouth Athletic Conference", add 
label define label_confno4 318 "Independent Mid-South Region", add 
label define label_confno4 319 "American Midwest Conference", add 
label define label_confno4 320 "Heart of America Athletic Conference", add 
label define label_confno4 321 "Midwest Classic Conference", add 
label define label_confno4 322 "Independent Midwest Region", add 
label define label_confno4 323 "Central Atlantic Collegiate Conf", add 
label define label_confno4 327 "Independent Northeast Region", add 
label define label_confno4 328 "Cascade Collegiate Conference", add 
label define label_confno4 331 "Independent Pacific Northwest Region", add 
label define label_confno4 332 "Eastern Intercollegiate Athletic Conf", add 
label define label_confno4 333 "Florida Sun Conference", add 
label define label_confno4 334 "Southern States Athletic Conference", add 
label define label_confno4 335 "Independent Southeast Region", add 
label define label_confno4 337 "Gulf Coast Athletic Conference", add 
label define label_confno4 340 "Sooner Athletic Conference", add 
label define label_confno4 341 "Independent Southwest Region", add 
label define label_confno4 342 "Other", add 
label define label_confno4 351 "Dakota Athletic Conference", add 
label define label_confno4 352 "Frontier Conference", add 
label define label_confno4 353 "Red River Athletic Conference", add 
label define label_confno4 354 "Upper Midwest Athletic Conference", add 
label define label_confno4 355 "Central States Football League", add 
label define label_confno4 356 "Mid-States Football Association", add 
label define label_confno4 357 "Sunrise Conference", add 
label define label_confno4 359 "Northern Athletics Conference", add 
label define label_confno4 360 "Great South Athletic Conference", add 
label define label_confno4 361 "Landmark Conference", add 
label define label_confno4 362 "Great West Conference", add 
label define label_confno4 363 "New England Collegiate Conference", add 
label define label_confno4 364 "Colonial States Athletic Conference", add 
label define label_confno4 365 "North Eastern Athletic Conference", add 
label values confno4 label_confno4
label define label_calsys -2 "Not applicable" 
label define label_calsys 1 "Semester", add 
label define label_calsys 2 "Quarter", add 
label define label_calsys 3 "Trimester", add 
label define label_calsys 4 "Four-one-four plan", add 
label define label_calsys 5 "Other academic year", add 
label define label_calsys 6 "Differs by program", add 
label define label_calsys 7 "Continuous", add 
label values calsys label_calsys
label define label_ft_ug -2 "Not applicable" 
label define label_ft_ug 1 "Yes", add 
label define label_ft_ug 2 "No", add 
label values ft_ug label_ft_ug
label define label_ft_ftug -2 "Not applicable" 
label define label_ft_ftug 1 "Yes", add 
label define label_ft_ftug 2 "No", add 
label values ft_ftug label_ft_ftug
label define label_ft_gd -1 "Not reported" 
label define label_ft_gd -2 "Not applicable", add 
label define label_ft_gd 1 "Yes", add 
label define label_ft_gd 2 "No", add 
label values ft_gd label_ft_gd
label define label_pt_ug -2 "Not applicable" 
label define label_pt_ug 1 "Yes", add 
label define label_pt_ug 2 "No", add 
label values pt_ug label_pt_ug
label define label_pt_ftug -2 "Not applicable" 
label define label_pt_ftug 1 "Yes", add 
label define label_pt_ftug 2 "No", add 
label values pt_ftug label_pt_ftug
label define label_pt_gd -1 "Not reported" 
label define label_pt_gd -2 "Not applicable", add 
label define label_pt_gd 1 "Yes", add 
label define label_pt_gd 2 "No", add 
label values pt_gd label_pt_gd
label define label_tuitvary -1 "Not reported" 
label define label_tuitvary -2 "Not applicable", add 
label define label_tuitvary 1 "Yes", add 
label define label_tuitvary 2 "No", add 
label values tuitvary label_tuitvary
label define label_room -1 "Not reported" 
label define label_room -2 "Not applicable", add 
label define label_room 1 "Yes", add 
label define label_room 2 "No", add 
label values room label_room
label define label_board -1 "Not reported" 
label define label_board -2 "Not applicable", add 
label define label_board 1 "Yes, number of meals in the maximum meal plan offered", add 
label define label_board 2 "Yes, number of meals per week can vary", add 
label define label_board 3 "No", add 
label values board label_board
label define label_tuitpl -1 "Not reported" 
label define label_tuitpl -2 "Not applicable", add 
label define label_tuitpl 1 "Yes", add 
label define label_tuitpl 2 "No", add 
label values tuitpl label_tuitpl
label define label_tuitpl1 -1 "Not reported" 
label define label_tuitpl1 -2 "Not applicable", add 
label define label_tuitpl1 0 "Implied no", add 
label define label_tuitpl1 1 "Yes", add 
label values tuitpl1 label_tuitpl1
label define label_tuitpl2 -1 "Not reported" 
label define label_tuitpl2 -2 "Not applicable", add 
label define label_tuitpl2 0 "Implied no", add 
label define label_tuitpl2 1 "Yes", add 
label values tuitpl2 label_tuitpl2
label define label_tuitpl3 -1 "Not reported" 
label define label_tuitpl3 -2 "Not applicable", add 
label define label_tuitpl3 0 "Implied no", add 
label define label_tuitpl3 1 "Yes", add 
label values tuitpl3 label_tuitpl3
label define label_tuitpl4 -1 "Not reported" 
label define label_tuitpl4 -2 "Not applicable", add 
label define label_tuitpl4 0 "Implied no", add 
label define label_tuitpl4 1 "Yes", add 
label values tuitpl4 label_tuitpl4
label define label_disab -1 "Not reported" 
label define label_disab -2 "Not applicable", add 
label define label_disab 1 "3 percent or less", add 
label define label_disab 2 "More than 3 percent", add 
* the following are the possible code values for imputation variables
*'A' 'Item not applicable'
*'B' 'Institution left item blank'
*'C' 'Analyst corrected reported value'
*'D' 'Do not know'
*'G' 'Data generated from other data values'
*'H' 'Value not derived - data not usable'
*'J' 'Logical imputation'
*'K' 'Ratio adjustment '
*'L' 'Imputed using the Group Median procedure'
*'N' 'Imputed using Nearest Neighbor procedure'
*'P' 'Imputed using Carry Forward procedure'
*'R' 'Reported'
*'Z' 'Implied zero'
tab peo1istr
tab peo2istr
tab peo3istr
tab peo4istr
tab peo5istr
tab peo6istr
tab cntlaffi
tab pubprime
tab pubsecon
tab relaffil
tab level1
tab level2
tab level3
tab level4
tab level5
tab level6
tab level7
tab level8
tab level12
tab level17
tab level18
tab level19
tab openadmp
tab admcon1
tab admcon2
tab admcon3
tab admcon4
tab admcon5
tab admcon6
tab admcon7
tab admcon8
tab admcon9
tab appdate
tab xapplcnm
tab xapplcnw
tab xadmssnm
tab xadmssnw
tab xenrlftm
tab xenrlftw
tab xenrlptm
tab xenrlptw
tab satactdt
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
tab credits1
tab credits2
tab credits3
tab credits4
tab slo3
tab slo5
tab slo51
tab slo52
tab slo53
tab slo6
tab slo7
tab slo8
tab slo81
tab slo82
tab slo83
tab slo9
tab yrscoll
tab stusrv1
tab stusrv2
tab stusrv3
tab stusrv4
tab stusrv8
tab stusrv9
tab libfac
tab athassoc
tab assoc1
tab assoc2
tab assoc3
tab assoc4
tab assoc5
tab assoc6
tab sport1
tab confno1
tab sport2
tab confno2
tab sport3
tab confno3
tab sport4
tab confno4
tab calsys
tab xappfeeu
tab xappfeeg
tab ft_ug
tab ft_ftug
tab ft_gd
tab pt_ug
tab pt_ftug
tab pt_gd
tab tuitvary
tab room
tab xroomcap
tab board
tab xmealswk
tab xroomamt
tab xbordamt
tab xrmbdamt
tab alloncam
tab xenrlm
tab xenrlw
tab xenrlt
tab xapplcn
tab xadmssn
tab xenrlft
tab xenrlpt
tab tuitpl
tab tuitpl1
tab tuitpl2
tab tuitpl3
tab tuitpl4
tab disab
tab xdisabpc
summarize applcnm
summarize applcnw
summarize admssnm
summarize admssnw
summarize enrlftm
summarize enrlftw
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
summarize applfeeu
summarize applfeeg
summarize roomcap
summarize mealswk
summarize roomamt
summarize boardamt
summarize rmbrdamt
summarize enrlm
summarize enrlw
summarize enrlt
summarize applcn
summarize admssn
summarize enrlft
summarize enrlpt
summarize disabpct
// save dct_ic2010_rv

