set more off
clear all
local curdate = c(current_date)

// Use this code to download, build, and save to the local computer
// data from the GRADUATION RATES (2yr Institutions) survey at the US DOE's
// Integrated Postsecondary Education Data Stystem (IPEDS).

// Mar/2018:	Adam Ross Nelson - Initial Build.

/*#############################################################################
      Maintained/more information at:
	  https://github.com/adamrossnelson/StataIPEDSAll
  
##############################################################################*/
// Utilizes version of sshnd (interactive file picker)/
do https://raw.githubusercontent.com/adamrossnelson/sshnd/master/sshnd.do

capture log close                             // Close stray log files.
log using "$loggbl", append                   // Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)  // Define spacer.
version 13                                    // Enforce version compatibility.
di c(pwd)                                     // Confrim working directory.
version 13                                    // Enforce version control for Version 13.

// Loop is designed to downlaod zip files and NCES provided Stata do files.
// Stata do files need cleaning (removal stray char(13) + char(10) + char(34)).
forvalues yindex = 2002 / 2016 {
	copy https://nces.ed.gov/ipeds/datacenter/data/GR`yindex'_Data_Stata.zip .
	unzipfile GR`yindex'_Data_Stata.zip

	copy https://nces.ed.gov/ipeds/datacenter/data/GR`yindex'_Stata.zip .
	unzipfile GR`yindex'_Stata.zip

	// The NCES provided -do- files have some lines that need to be removed
	// before we can call them from the master -do- file.
	scalar fcontents = fileread("gr`yindex'.do")
	scalar fcontents = subinstr(fcontents, "insheet", "// insheet", 1)
	scalar fcontents = subinstr(fcontents, "save", "// save", .)

	// Lines from the gr2002 files that need to be removed.
	scalar fcontents = subinstr(fcontents, "label define label_line", "// label define label_line", .)
	scalar fcontents = subinstr(fcontents, "label values line label_line", "// label values line label_line", .)

	scalar byteswritten = filewrite("gr`yindex'.do", fcontents, 1)

	// File name convetions not consistent through the years.
	// Prior to 2007 IPEDS did not provide _rv_ editions of the data.
	// As of July 1, 2017 IPEDS had not yet release _rv_ edition of 2015.
	if `yindex' > 2006 & `yindex' < 2015 {
		import delimited gr`yindex'_rv_data_stata.csv, clear
	}
	else {
        	import delimited gr`yindex'_data_stata.csv, clear
	}
	
	// Run the NCES provided do files.
	di "QUIET RUN OF gr`yindex'.do"           // Provid user with information for log file.
	qui do gr`yindex'.do                      // Quietyly run NCES provided do files.
	drop x*                                   // Remove imputation flags. Reduces file size.
	
	// VARIABLE NAME conventions changed. Manage evolving name conventions.
	// 2002 through 2007 variable names changed to match 2008 & forward.
	if (`yindex' < 2008) {
		rename grrace16 grtotlw               // Total women
		rename grrace24 grtotlt               // Grand total
		rename grrace15 grtotlm               // Total men
		rename grrace06 graianw               // American Indian or Alaska Native women - new
		rename grrace19 graiant               // American Indian or Alaska Native total - new
		rename grrace05 graianm               // American Indian or Alaska Native men - new
		rename grrace08 grasiaw               // Asian or Pacific Islander women - new
		rename grrace20 grasiat               // Asian or Pacific Islander total - new
		rename grrace07 grasiam               // Asian or Pacific Islander men - new
		rename grrace04 grbkaaw               // Black or African American (Non-Hispanic) women - new
		rename grrace18 grbkaat               // Black or African American (Non-Hispanic) total - new
		rename grrace03 grbkaam               // Black or African American (Non-Hispanic) men - new
		rename grrace10 grhispw               // Hispanic women - new
		rename grrace21 grhispt               // Hispanic total - new
		rename grrace09 grhispm               // Hispanic men - new
		rename grrace12 grwhitw               // White Non-Hispanic women - new
		rename grrace22 grwhitt               // White Non-Hispanic total - new
		rename grrace11 grwhitm               // White Non-Hispanic men - new
		rename grrace14 grunknw               // Race/ethnicity unknown women
		rename grrace23 grunknt               // Race/ethnicity unknown total
		rename grrace13 grunknm               // Race/ethnicity unknown men
		rename grrace02 grnralw               // Nonresident alien women
		rename grrace17 grnralt               // Nonresident alien total
		rename grrace01 grnralm               // Nonresident alien men
		// Also generate missing variables that occur in years after 2007
		gen gr2morw = .                       // Two or more races women - new
		gen gr2mort = .                       // Two or more races total - new
		gen gr2morm = .                       // Two or more races men - new
		gen grnhpiw = .                       // Native Hawaiian or Other Pacific Islander women - new
		gen grnhpit = .                       // Native Hawaiian or Other Pacific Islander total - new
		gen grnhpim = .                       // Native Hawaiian or Other Pacific Islander men - new
	}
		
	// Survey years 2008, 2009, and 2010 contain unconventional
	// variables. To simplify keep only the variables that are 
	// most consistent across survey years.
	if (`yindex' == 2008) | (`yindex' == 2009) | (`yindex' == 2010) {
		keep unitid grtype chrtstat cohort section ///
		grtotlt grtotlm grtotlw graiant graianm graianw grasiat grasiam /// Other variables were omitted because they were derived only for the
		grasiaw grbkaat grbkaam grbkaaw grhispt grhispm grhispw grnhpit /// years 2008, 2009, and 2010. 
		grnhpim grnhpiw grwhitt grwhitm grwhitw gr2mort gr2morm gr2morw ///
		grunknt grunknm grunknw grnralt grnralm grnralw					
	}
	
	// Reshape
	
	keep if (chrtstat == 12 | chrtstat == 13 | chrtstat == 20) & cohort == 4
	keep unitid chrtstat grnralm grnralw grbkaam grbkaaw graianm graianw ///
	grasiam grasiaw grhispm grhispw grwhitm grwhitw grunknm grunknw ///
	grtotlm grtotlw grnralt grbkaat graiant grasiat grhispt grwhitt ///
	grunknt grtotlt

	reshape wide grnralm grnralw grbkaam grbkaaw graianm graianw ///
	grasiam grasiaw grhispm grhispw grwhitm grwhitw grunknm grunknw ///
	grtotlm grtotlw grnralt grbkaat graiant grasiat grhispt grwhitt ///
	grunknt grtotlt, i(unitid) j(chrtstat)
	/*
	// Calculate 2 (100%) year graduation rates
	gen ratedgrtotlw2yr = grtotlw22 / grtotlw12
	gen ratedgrtotlt2yr = grtotlt22 / grtotlt12
	gen ratedgrtotlm2yr = grtotlm22 / grtotlm12
	gen ratedgraianw2yr = graianw22 / graianw12
	gen ratedgraiant2yr = graiant22 / graiant12
	gen ratedgraianm2yr = graianm22 / graianm12
	gen ratedgrasiaw2yr = grasiaw22 / grasiaw12
	gen ratedgrasiat2yr = grasiat22 / grasiat12
	gen ratedgrasiam2yr = grasiam22 / grasiam12
	gen ratedgrbkaaw2yr = grbkaaw22 / grbkaaw12
	gen ratedgrbkaat2yr = grbkaat22 / grbkaat12
	gen ratedgrbkaam2yr = grbkaam22 / grbkaam12
	gen ratedgrhispw2yr = grhispw22 / grhispw12
	gen ratedgrhispt2yr = grhispt22 / grhispt12
	gen ratedgrhispm2yr = grhispm22 / grhispm12
	gen ratedgrwhitw2yr = grwhitw22 / grwhitw12
	gen ratedgrwhitt2yr = grwhitt22 / grwhitt12
	gen ratedgrwhitm2yr = grwhitm22 / grwhitm12
	gen ratedgrunknw2yr = grunknw22 / grunknw12
	gen ratedgrunknt2yr = grunknt22 / grunknt12
	gen ratedgrunknm2yr = grunknm22 / grunknm12
	gen ratedgrnralw2yr = grnralw22 / grnralw12
	gen ratedgrnralt2yr = grnralt22 / grnralt12
	gen ratedgrnralm2yr = grnralm22 / grnralm12 
	*/
	/*
	// Calculate 3 (150%) year graduation rates
	gen ratedgrtotlw3yr = (grtotlw13 + grtotlw22) / grtotlw12
	gen ratedgrtotlt3yr = (grtotlt13 + grtotlt22) / grtotlt12
	gen ratedgrtotlm3yr = (grtotlm13 + grtotlm22) / grtotlm12
	gen ratedgraianw3yr = (graianw13 + graianw22) / graianw12
	gen ratedgraiant3yr = (graiant13 + graiant22) / graiant12
	gen ratedgraianm3yr = (graianm13 + graianm22) / graianm12
	gen ratedgrasiaw3yr = (grasiaw13 + grasiaw22) / grasiaw12
	gen ratedgrasiat3yr = (grasiat13 + grasiat22) / grasiat12
	gen ratedgrasiam3yr = (grasiam13 + grasiam22) / grasiam12
	gen ratedgrbkaaw3yr = (grbkaaw13 + grbkaaw22) / grbkaaw12
	gen ratedgrbkaat3yr = (grbkaat13 + grbkaat22) / grbkaat12
	gen ratedgrbkaam3yr = (grbkaam13 + grbkaam22) / grbkaam12
	gen ratedgrhispw3yr = (grhispw13 + grhispw22) / grhispw12
	gen ratedgrhispt3yr = (grhispt13 + grhispt22) / grhispt12
	gen ratedgrhispm3yr = (grhispm13 + grhispm22) / grhispm12
	gen ratedgrwhitw3yr = (grwhitw13 + grwhitw22) / grwhitw12
	gen ratedgrwhitt3yr = (grwhitt13 + grwhitt22) / grwhitt12
	gen ratedgrwhitm3yr = (grwhitm13 + grwhitm22) / grwhitm12
	gen ratedgrunknw3yr = (grunknw13 + grunknw22) / grunknw12
	gen ratedgrunknt3yr = (grunknt13 + grunknt22) / grunknt12
	gen ratedgrunknm3yr = (grunknm13 + grunknm22) / grunknm12
	gen ratedgrnralw3yr = (grnralw13 + grnralw22) / grnralw12
	gen ratedgrnralt3yr = (grnralt13 + grnralt22) / grnralt12
	gen ratedgrnralm3yr = (grnralm13 + grnralm22) / grnralm12 
	*/
	// Calculate transfer out rates
	gen ratedgrtotlwXfr = grtotlw20 / grtotlw12
	gen ratedgrtotltXfr = grtotlt20 / grtotlt12
	gen ratedgrtotlmXfr = grtotlm20 / grtotlm12
	gen ratedgraianwXfr = graianw20 / graianw12
	gen ratedgraiantXfr = graiant20 / graiant12
	gen ratedgraianmXfr = graianm20 / graianm12
	gen ratedgrasiawXfr = grasiaw20 / grasiaw12
	gen ratedgrasiatXfr = grasiat20 / grasiat12
	gen ratedgrasiamXfr = grasiam20 / grasiam12
	gen ratedgrbkaawXfr = grbkaaw20 / grbkaaw12
	gen ratedgrbkaatXfr = grbkaat20 / grbkaat12
	gen ratedgrbkaamXfr = grbkaam20 / grbkaam12
	gen ratedgrhispwXfr = grhispw20 / grhispw12
	gen ratedgrhisptXfr = grhispt20 / grhispt12
	gen ratedgrhispmXfr = grhispm20 / grhispm12
	gen ratedgrwhitwXfr = grwhitw20 / grwhitw12
	gen ratedgrwhittXfr = grwhitt20 / grwhitt12
	gen ratedgrwhitmXfr = grwhitm20 / grwhitm12
	gen ratedgrunknwXfr = grunknw20 / grunknw12
	gen ratedgrunkntXfr = grunknt20 / grunknt12
	gen ratedgrunknmXfr = grunknm20 / grunknm12
	gen ratedgrnralwXfr = grnralw20 / grnralw12
	gen ratedgrnraltXfr = grnralt20 / grnralt12
	gen ratedgrnralmXfr = grnralm20 / grnralm12 
	
	// Generate variable labels for the calculated graduation rates for
	// 4 year, 5 year, and 6 year graduation rates. 
	/*
	// Labels for 2 year calculated graduation rates 
	label variable 	ratedgrtotlt2yr "2yr Grad Total Rate" 
	label variable 	ratedgrtotlw2yr "2yr Women Grad Total Rate" 
	label variable 	ratedgrtotlm2yr "2yr Men Grad Total Rate" 
	label variable 	ratedgraiant2yr "2yr Total Amer. Ind. Or AK Native Rate" 
	label variable 	ratedgraianw2yr "2yr Women Amer. Ind. Or AK Native Rate" 
	label variable 	ratedgraianm2yr "2yr Men Amer. Ind. Or AK Native Rate" 
	label variable 	ratedgrasiat2yr "2yr Total Asian rate" 
	label variable 	ratedgrasiaw2yr "2yr Women Asian rate" 
	label variable 	ratedgrasiam2yr "2yr Men Asian rate" 
	label variable 	ratedgrbkaat2yr "2yr Total Black or African American rate" 
	label variable 	ratedgrbkaaw2yr "2yr Women Black or African American rate" 
	label variable 	ratedgrbkaam2yr "2yr Men Black or African American rate" 
	label variable 	ratedgrhispt2yr "2yr Total Hispanic rate" 
	label variable 	ratedgrhispw2yr "2yr Women Hispanic rate" 
	label variable 	ratedgrhispm2yr "2yr Men Hispanic rate" 
	label variable 	ratedgrwhitt2yr "2yr Total White rate" 
	label variable 	ratedgrwhitw2yr "2yr Women White rate" 
	label variable 	ratedgrwhitm2yr "2yr Men White rate" 
	label variable 	ratedgrunknt2yr "2yr Total Race/ethnicity Unknown rate" 
	label variable 	ratedgrunknw2yr "2yr Women Race/ethnicity Unknown rate" 
	label variable 	ratedgrunknm2yr "2yr Men Race/ethnicty Unknown rate" 
	label variable 	ratedgrnralt2yr "2yr Total Nonresident Alien rate" 
	label variable  ratedgrnralw2yr "2yr Women Nonresident Alien rate" 
	label variable  ratedgrnralm2yr "2yr Men Nonresident Alien rate"
	*/
	/*
	// Labels for 3 year calculated graduation rates
	label variable 	ratedgrtotlt3yr "3yr Grad Total Rate" 
	label variable 	ratedgrtotlw3yr "3yr Women Grad Total Rate" 
	label variable 	ratedgrtotlm3yr "3yr Men Grad Total Rate" 
	label variable 	ratedgraiant3yr "3yr Total Amer. Ind. Or AK Native Rate" 
	label variable 	ratedgraianw3yr "3yr Women Amer. Ind. Or AK Native Rate" 
	label variable 	ratedgraianm3yr "3yr Men Amer. Ind. Or AK Native Rate" 
	label variable 	ratedgrasiat3yr "3yr Total Asian rate" 
	label variable 	ratedgrasiaw3yr "3yr Women Asian rate" 
	label variable 	ratedgrasiam3yr "3yr Men Asian rate" 
	label variable 	ratedgrbkaat3yr "3yr Total Black or African American rate" 
	label variable 	ratedgrbkaaw3yr "3yr Women Black or African American rate" 
	label variable 	ratedgrbkaam3yr "3yr Men Black or African American rate" 
	label variable 	ratedgrhispt3yr "3yr Total Hispanic rate" 
	label variable 	ratedgrhispw3yr "3yr Women Hispanic rate" 
	label variable 	ratedgrhispm3yr "3yr Men Hispanic rate" 
	label variable 	ratedgrwhitt3yr "3yr Total White rate" 
	label variable 	ratedgrwhitw3yr "3yr Women White rate" 
	label variable 	ratedgrwhitm3yr "3yr Men White rate" 
	label variable 	ratedgrunknt3yr "3yr Total Race/ethnicity Unknown rate" 
	label variable 	ratedgrunknw3yr "3yr Women Race/ethnicity Unknown rate" 
	label variable 	ratedgrunknm3yr "3yr Men Race/ethnicty Unknown rate" 
	label variable 	ratedgrnralt3yr "3yr Total Nonresident Alien rate" 
	label variable  ratedgrnralw3yr "3yr Women Nonresident Alien rate" 
	label variable  ratedgrnralm3yr "3yr Men Nonresident Alien rate"
	*/
	// The following labels are graduation count variables
	label variable grtotlw12 "Women Grad Total Cohort"
	label variable grtotlt12 "Grad Total Cohort"
	label variable grtotlm12 "Men Grad Total Cohort"
	label variable graianw12 "Women Amer. Ind. Or AK Native Cohort"
	label variable graiant12 "Total Amer. Ind. Or AK Native Cohort"
	label variable graianm12 "Men Amer. Ind. Or AK Native Cohort"
	label variable grasiaw12 "Women Asian Cohort"
	label variable grasiat12 "Total Asian Cohort"
	label variable grasiam12 "Men Asian Cohort"
	label variable grbkaaw12 "Women Black or African American Cohort"
	label variable grbkaat12 "Total Black or African American Cohort"
	label variable grbkaam12 "Men Black or African American Cohort"
	label variable grhispw12 "Women Hispanic Cohort"
	label variable grhispt12 "Total Hispanic Cohort"
	label variable grhispm12 "Men Hispanic Cohort"
	label variable grwhitw12 "Women White Cohort"
	label variable grwhitt12 "Total White Cohort"
	label variable grwhitm12 "Men White Cohort"
	label variable grunknw12 "Women Race/ethnicity Unknown Cohort"
	label variable grunknt12 "Total Race/ethnicity Unknown Cohort"
	label variable grunknm12 "Men Race/ethnicty Unknown Cohort"
	label variable grnralw12 "Women Nonresident Alien Cohort"
	label variable grnralt12 "Total Nonresident Alien Cohort"
	label variable grnralm12 "Men Nonresident Alien Cohort"
	/*
	// Labels for 2 year graduation count variables
	label variable grtotlw22 "2yr Women Grad Total Count"
	label variable grtotlt22 "2yr Grad Total Count"
	label variable grtotlm22 "2yr Men Grad Total Count"
	label variable graianw22 "2yr Women Amer. Ind. Or AK Native Count"
	label variable graiant22 "2yr Total Amer. Ind. Or AK Native Count"
	label variable graianm22 "2yr Men Amer. Ind. Or AK Native Count"
	label variable grasiaw22 "2yr Women Asian Count"
	label variable grasiat22 "2yr Total Asian Count"
	label variable grasiam22 "2yr Men Asian Count"
	label variable grbkaaw22 "2yr Women Black or African American Count"
	label variable grbkaat22 "2yr Total Black or African American Count"
	label variable grbkaam22 "2yr Men Black or African American Count"
	label variable grhispw22 "2yr Women Hispanic Count"
	label variable grhispt22 "2yr Total Hispanic Count"
	label variable grhispm22 "2yr Men Hispanic Count"
	label variable grwhitw22 "2yr Women White Count"
	label variable grwhitt22 "2yr Total White Count"
	label variable grwhitm22 "2yr Men White Count"
	label variable grunknw22 "2yr Women Race/ethnicity Unknown Count"
	label variable grunknt22 "2yr Total Race/ethnicity Unknown Count"
	label variable grunknm22 "2yr Men Race/ethnicty Unknown Count"
	label variable grnralw22 "2yr Women Nonresident Alien Count"
	label variable grnralt22 "2yr Total Nonresident Alien Count"
	label variable grnralm22 "2yr Men Nonresident Alien Count"
	*/
	// Labels for 3 year graduation count variables
	label variable grtotlw13 "3yr Women Grad Total Count"
	label variable grtotlt13 "3yr Grad Total Count"
	label variable grtotlm13 "3yr Men Grad Total Count"
	label variable graianw13 "3yr Women Amer. Ind. Or AK Native Count"
	label variable graiant13 "3yr Total Amer. Ind. Or AK Native Count"
	label variable graianm13 "3yr Men Amer. Ind. Or AK Native Count"
	label variable grasiaw13 "3yr Women Asian Count"
	label variable grasiat13 "3yr Total Asian Count"
	label variable grasiam13 "3yr Men Asian Count"
	label variable grbkaaw13 "3yr Women Black or African American Count"
	label variable grbkaat13 "3yr Total Black or African American Count"
	label variable grbkaam13 "3yr Men Black or African American Count"
	label variable grhispw13 "3yr Women Hispanic Count"
	label variable grhispt13 "3yr Total Hispanic Count"
	label variable grhispm13 "3yr Men Hispanic Count"
	label variable grwhitw13 "3yr Women White Count"
	label variable grwhitt13 "3yr Total White Count"
	label variable grwhitm13 "3yr Men White Count"
	label variable grunknw13 "3yr Women Race/ethnicity Unknown Count"
	label variable grunknt13 "3yr Total Race/ethnicity Unknown Count"
	label variable grunknm13 "3yr Men Race/ethnicty Unknown Count"
	label variable grnralw13 "3yr Women Nonresident Alien Count"
	label variable grnralt13 "3yr Total Nonresident Alien Count"
	label variable grnralm13 "3yr Men Nonresident Alien Count"

	gen int isYr = `yindex'	                                        // Add the isYr index for later merge.
	order isYr, after(unitid)                                       // Order isYr after unitid, easier browsing.

	saveold "gr2yr`yindex'_data_stata.dta", version(13) replace        // Save cleaned data file.
	di `sp'	`sp'                                                    // Spacer for the output.
}

use GR2yr2016_data_stata.dta, clear
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"                                              // Output for log file.
	append using "gr2yr`yindex'_data_stata.dta", force
	di `sp'	                                                        // Spacing for log file.
}

order rated*, after(isYr)        // Move the rated variables first in varlist.
cd ..                            // Move up file directory level, compress, add notes. 
compress                         // Save resulting panel data set.

label data "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll/tree/master"
notes _dta: "PanelBuildInfo: https://github.com/adamrossnelson/StataIPEDSAll/tree/master"
notes _dta: "Panel built on `c(current_date)'"
saveold "$dtagbl", replace version(13)

qui { 
noi di "#####################################################################"
noi di ""
noi di "      Saved $dtagbl"
noi di ""
noi di "######################################################################"
}
log close

