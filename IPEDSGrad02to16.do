set more off
clear all
local curdate = c(current_date)
set linesize 200

/*
// Set some script general parameters. Customize for specific environment.
// Change to the working directory of context.
// local workingdirectory "C:\statadata\IPEDmost"

// Use this code to download, build, and save to the local computer
// data from the GRADUATION RATES survey at the US DOE's
// Integrated Postsecondary Education Data Stystem (IPEDS).
// This code is designed to download a set of IPEDS surveys from nces.edu.gov
// Surveys included are the:
//       GRYYYY series - Graduation rates.
//           (Note that graduation rates rely on data from a series of years.
//            The dictionary files for each year provide more specific
//            information. Given the unique nature of graduation rate data
//            this routine provides a series of files instead of one combined
//            panal data file.
//           (Prepares folder called: "graduate rates 02 to 15" */

// Jan/2018:	Naiya Patel - Initial Build.

/*#############################################################################

      Maintained/more information at:
	  https://github.com/adamrossnelson/StataIPEDSAll
  
##############################################################################*/
// Utilizes preckage version of sshnd (interactive file picker)/
// Stable 1.0 version of sshnd documentation available at:
// https://github.com/adamrossnelson/sshnd/tree/1.0


cd c:/statadata

capture log close                                                       // Close any stray open log files.
log using "IPEDmost `curdate'.txt", replace                             // Open a log file.
cd                                                                      // Confirm working directory location.

do https://raw.githubusercontent.com/adamrossnelson/sshnd/master/sshnd.do

capture log close                             // Close stray log files.
log using "$loggbl", append                   // Append sshnd established log file.
local sp char(13) char(10) char(13) char(10)  // Define spacer.
version 13                                    // Enforce version compatibility.
di c(pwd)                                     // Confrim working directory.


version 13                                    // Enforce version control for Version 13.
set more off                                  // (Simplies collabroation with legacy users.)

local sp char(13) char(10) char(13) char(10)  // Define spacer.

cd                                            // Confirm working directory information.
capture mkdir workspace	                      // Make a directory to store the zip files.
//cd workspace                                // Move into working directory location.
                                              // Spacer for the output.

clear all

//cd workspace

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
	
		keep if (chrtstat == 12|(chrtstat > 16 & chrtstat < 20)) & cohort == 2
		keep unitid chrtstat grnralm grnralw grbkaam grbkaaw graianm graianw ///
		grasiam grasiaw grhispm grhispw grwhitm grwhitw grunknm grunknw ///
		grtotlm grtotlw grnralt grbkaat graiant grasiat grhispt grwhitt ///
		grunknt grtotlt

		reshape wide grnralm grnralw grbkaam grbkaaw graianm graianw ///
		grasiam grasiaw grhispm grhispw grwhitm grwhitw grunknm grunknw ///
		grtotlm grtotlw grnralt grbkaat graiant grasiat grhispt grwhitt ///
		grunknt grtotlt, i(unitid) j(chrtstat)
		
		
		gen ratedgrtotlw4yr = grtotlw17 / grtotlw12
		gen ratedgrtotlt4yr = grtotlt17 / grtotlt12
		gen ratedgrtotlm4yr = grtotlm17 / grtotlm12
		gen ratedgraianw4yr = graianw17 / graianw12
		gen ratedgraiant4yr = graiant17 / graiant12
		gen ratedgraianm4yr = graianm17 / graianm12
		gen ratedgrasiaw4yr = grasiaw17 / grasiaw12
		gen ratedgrasiat4yr = grasiat17 / grasiat12
		gen ratedgrasiam4yr = grasiam17 / grasiam12
		gen ratedgrbkaaw4yr = grbkaaw17 / grbkaaw12
		gen ratedgrbkaat4yr = grbkaat17 / grbkaat12
		gen ratedgrbkaam4yr = grbkaam17 / grbkaam12
		gen ratedgrhispw4yr = grhispw17 / grhispw12
		gen ratedgrhispt4yr = grhispt17 / grhispt12
		gen ratedgrhispm4yr = grhispm17 / grhispm12
		gen ratedgrwhitw4yr = grwhitw17 / grwhitw12
		gen ratedgrwhitt4yr = grwhitt17 / grwhitt12
		gen ratedgrwhitm4yr = grwhitm17 / grwhitm12
		gen ratedgrunknw4yr = grunknw17 / grunknw12
		gen ratedgrunknt4yr = grunknt17 / grunknt12
		gen ratedgrunknm4yr = grunknm17 / grunknm12
		gen ratedgrnralw4yr = grnralw17 / grnralw12
		gen ratedgrnralt4yr = grnralt17 / grnralt12
		gen ratedgrnralm4yr = grnralm17 / grnralm12 
		
		gen ratedgrtotlw5yr = (grtotlw17 + grtotlw18) / grtotlw12
		gen ratedgrtotlt5yr = (grtotlt17 + grtotlt18) / grtotlt12
		gen ratedgrtotlm5yr = (grtotlm17 + grtotlm18) / grtotlm12
		gen ratedgraianw5yr = (graianw17 + graianw18) / graianw12
		gen ratedgraiant5yr = (graiant17 + graiant18) / graiant12
		gen ratedgraianm5yr = (graianm17 + graianm18) / graianm12
		gen ratedgrasiaw5yr = (grasiaw17 + grasiaw18) / grasiaw12
		gen ratedgrasiat5yr = (grasiat17 + grasiat18) / grasiat12
		gen ratedgrasiam5yr = (grasiam17 + grasiam18) / grasiam12
		gen ratedgrbkaaw5yr = (grbkaaw17 + grbkaaw18) / grbkaaw12
		gen ratedgrbkaat5yr = (grbkaat17 + grbkaat18) / grbkaat12
		gen ratedgrbkaam5yr = (grbkaam17 + grbkaam18) / grbkaam12
		gen ratedgrhispw5yr = (grhispw17 + grhispw18) / grhispw12
		gen ratedgrhispt5yr = (grhispt17 + grhispt18) / grhispt12
		gen ratedgrhispm5yr = (grhispm17 + grhispm18) / grhispm12
		gen ratedgrwhitw5yr = (grwhitw17 + grwhitw18) / grwhitw12
		gen ratedgrwhitt5yr = (grwhitt17 + grwhitt18) / grwhitt12
		gen ratedgrwhitm5yr = (grwhitm17 + grwhitm18) / grwhitm12
		gen ratedgrunknw5yr = (grunknw17 + grunknw18) / grunknw12
		gen ratedgrunknt5yr = (grunknt17 + grunknt18) / grunknt12
		gen ratedgrunknm5yr = (grunknm17 + grunknm18) / grunknm12
		gen ratedgrnralw5yr = (grnralw17 + grnralw18) / grnralw12
		gen ratedgrnralt5yr = (grnralt17 + grnralt18) / grnralt12
		gen ratedgrnralm5yr = (grnralm17 + grnralm18) / grnralm12 
		
		gen ratedgrtotlw6yr = (grtotlw17 + grtotlw18 + grtotlw19) / grtotlw12
		gen ratedgrtotlt6yr = (grtotlt17 + grtotlt18 + grtotlt19) / grtotlt12
		gen ratedgrtotlm6yr = (grtotlm17 + grtotlm18 + grtotlm19) / grtotlm12
		gen ratedgraianw6yr = (graianw17 + graianw18 + graianw19) / graianw12
		gen ratedgraiant6yr = (graiant17 + graiant18 + graiant19) / graiant12
		gen ratedgraianm6yr = (graianm17 + graianm18 + graianm19) / graianm12
		gen ratedgrasiaw6yr = (grasiaw17 + grasiaw18 + grasiaw19) / grasiaw12
		gen ratedgrasiat6yr = (grasiat17 + grasiat18 + grasiat19) / grasiat12
		gen ratedgrasiam6yr = (grasiam17 + grasiam18 + grasiam19) / grasiam12
		gen ratedgrbkaaw6yr = (grbkaaw17 + grbkaaw18 + grbkaaw19) / grbkaaw12
		gen ratedgrbkaat6yr = (grbkaat17 + grbkaat18 + grbkaat19) / grbkaat12
		gen ratedgrbkaam6yr = (grbkaam17 + grbkaam18 + grbkaam19) / grbkaam12
		gen ratedgrhispw6yr = (grhispw17 + grhispw18 + grhispw19) / grhispw12
		gen ratedgrhispt6yr = (grhispt17 + grhispt18 + grhispt19) / grhispt12
		gen ratedgrhispm6yr = (grhispm17 + grhispm18 + grhispm19) / grhispm12
		gen ratedgrwhitw6yr = (grwhitw17 + grwhitw18 + grwhitw19) / grwhitw12
		gen ratedgrwhitt6yr = (grwhitt17 + grwhitt18 + grwhitt19) / grwhitt12
		gen ratedgrwhitm6yr = (grwhitm17 + grwhitm18 + grwhitm19) / grwhitm12
		gen ratedgrunknw6yr = (grunknw17 + grunknw18 + grunknw19) / grunknw12
		gen ratedgrunknt6yr = (grunknt17 + grunknt18 + grunknt19) / grunknt12
		gen ratedgrunknm6yr = (grunknm17 + grunknm18 + grunknm19) / grunknm12
		gen ratedgrnralw6yr = (grnralw17 + grnralw18 + grnralw19) / grnralw12
		gen ratedgrnralt6yr = (grnralt17 + grnralt18 + grnralt19) / grnralt12
		gen ratedgrnralm6yr = (grnralm17 + grnralm18 + grnralm19) / grnralm12 
		
		// Generate variable labels for the calculated graduation rates for
		// 4 year, 5 year, and 6 year graduation rates. 
		
		// Labels for 4 year calculated graduation rates 
		label variable 	ratedgrtotlt4yr "4yr Grad Total Rate" 
		label variable 	ratedgrtotlw4yr "4yr Women Grad Total Rate" 
		label variable 	ratedgrtotlm4yr "4yr Men Grad Total Rate" 
		label variable 	ratedgraiant4yr "4yr Total Amer. Ind. Or AK Native Rate" 
		label variable 	ratedgraianw4yr "4yr Women Amer. Ind. Or AK Native Rate" 
		label variable 	ratedgraianm4yr "4yr Men Amer. Ind. Or AK Native Rate" 
		label variable 	ratedgrasiat4yr "4yr Total Asian rate" 
		label variable 	ratedgrasiaw4yr "4yr Women Asian rate" 
		label variable 	ratedgrasiam4yr "4yr Men Asian rate" 
		label variable 	ratedgrbkaat4yr "4yr Total Black or African American rate" 
		label variable 	ratedgrbkaaw4yr "4yr Women Black or African American rate" 
		label variable 	ratedgrbkaam4yr "4yr Men Black or African American rate" 
		label variable 	ratedgrhispt4yr "4yr Total Hispanic rate" 
		label variable 	ratedgrhispw4yr "4yr Women Hispanic rate" 
		label variable 	ratedgrhispm4yr "4yr Men Hispanic rate" 
		label variable 	ratedgrwhitt4yr "4yr Total White rate" 
		label variable 	ratedgrwhitw4yr "4yr Women White rate" 
		label variable 	ratedgrwhitm4yr "4yr Men White rate" 
		label variable 	ratedgrunknt4yr "4yr Total Race/ethnicity Unknown rate" 
		label variable 	ratedgrunknw4yr "4yr Women Race/ethnicity Unknown rate" 
		label variable 	ratedgrunknm4yr "4yr Men Race/ethnicty Unknown rate" 
		label variable 	ratedgrnralt4yr "4yr Total Nonresident Alien rate" 
		label variable  ratedgrnralw4yr "4yr Women Nonresident Alien rate" 
		label variable  ratedgrnralm4yr "4yr Men Nonresident Alien rate"
		
		// Labels for 5 year calculated graduation rates
		label variable 	ratedgrtotlt5yr "5yr Grad Total Rate" 
		label variable 	ratedgrtotlw5yr "5yr Women Grad Total Rate" 
		label variable 	ratedgrtotlm5yr "5yr Men Grad Total Rate" 
		label variable 	ratedgraiant5yr "5yr Total Amer. Ind. Or AK Native Rate" 
		label variable 	ratedgraianw5yr "5yr Women Amer. Ind. Or AK Native Rate" 
		label variable 	ratedgraianm5yr "5yr Men Amer. Ind. Or AK Native Rate" 
		label variable 	ratedgrasiat5yr "5yr Total Asian rate" 
		label variable 	ratedgrasiaw5yr "5yr Women Asian rate" 
		label variable 	ratedgrasiam5yr "5yr Men Asian rate" 
		label variable 	ratedgrbkaat5yr "5yr Total Black or African American rate" 
		label variable 	ratedgrbkaaw5yr "5yr Women Black or African American rate" 
		label variable 	ratedgrbkaam5yr "5yr Men Black or African American rate" 
		label variable 	ratedgrhispt5yr "5yr Total Hispanic rate" 
		label variable 	ratedgrhispw5yr "5yr Women Hispanic rate" 
		label variable 	ratedgrhispm5yr "5yr Men Hispanic rate" 
		label variable 	ratedgrwhitt5yr "5yr Total White rate" 
		label variable 	ratedgrwhitw5yr "5yr Women White rate" 
		label variable 	ratedgrwhitm5yr "5yr Men White rate" 
		label variable 	ratedgrunknt5yr "5yr Total Race/ethnicity Unknown rate" 
		label variable 	ratedgrunknw5yr "5yr Women Race/ethnicity Unknown rate" 
		label variable 	ratedgrunknm5yr "5yr Men Race/ethnicty Unknown rate" 
		label variable 	ratedgrnralt5yr "5yr Total Nonresident Alien rate" 
		label variable  ratedgrnralw5yr "5yr Women Nonresident Alien rate" 
		label variable  ratedgrnralm5yr "5yr Men Nonresident Alien rate"
		
		// Labels for 6 year calculated graduation rates
		label variable	ratedgrtotlt6yr "6yr Grad Total Rate" 
		label variable	ratedgrtotlw6yr "6yr Women Grad Total Rate" 
		label variable	ratedgrtotlm6yr "6yr Men Grad Total Rate" 
		label variable	ratedgraiant6yr "6yr Total Amer. Ind. Or AK Native Rate" 
		label variable	ratedgraianw6yr "6yr Women Amer. Ind. Or AK Native Rate" 
		label variable	ratedgraianm6yr "6yr Men Amer. Ind. Or AK Native Rate" 
		label variable	ratedgrasiat6yr "6yr Total Asian rate" 
		label variable	ratedgrasiaw6yr "6yr Women Asian rate" 
		label variable	ratedgrasiam6yr "6yr Men Asian rate" 
		label variable	ratedgrbkaat6yr "6yr Total Black or African American rate" 
		label variable	ratedgrbkaaw6yr "6yr Women Black or African American rate" 
		label variable	ratedgrbkaam6yr "6yr Men Black or African American rate" 
		label variable	ratedgrhispt6yr "6yr Total Hispanic rate" 
		label variable	ratedgrhispw6yr "6yr Women Hispanic rate" 
		label variable	ratedgrhispm6yr "6yr Men Hispanic rate" 
		label variable	ratedgrwhitt6yr "6yr Total White rate" 
		label variable	ratedgrwhitw6yr "6yr Women White rate" 
		label variable	ratedgrwhitm6yr "6yr Men White rate" 
		label variable	ratedgrunknt6yr "6yr Total Race/ethnicity Unknown rate" 
		label variable	ratedgrunknw6yr "6yr Women Race/ethnicity Unknown rate" 
		label variable	ratedgrunknm6yr "6yr Men Race/ethnicty Unknown rate" 
		label variable	ratedgrnralt6yr "6yr Total Nonresident Alien rate"
		label variable  ratedgrnralw6yr "6yr Women Nonresident Alien rate" 
		label variable  ratedgrnralm6yr "6yr Men Nonresident Alien rate" 
		
		// The following labels are graduation rates for each cohort
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
		
		// Labels for 4 year graduation rate variables
		label variable grtotlw17 "4yr Women Grad Total Count"
		label variable grtotlt17 "4yr Grad Total Count"
		label variable grtotlm17 "4yr Men Grad Total Count"
		label variable graianw17 "4yr Women Amer. Ind. Or AK Native Count"
		label variable graiant17 "4yr Total Amer. Ind. Or AK Native Count"
		label variable graianm17 "4yr Men Amer. Ind. Or AK Native Count"
		label variable grasiaw17 "4yr Women Asian Count"
		label variable grasiat17 "4yr Total Asian Count"
		label variable grasiam17 "4yr Men Asian Count"
		label variable grbkaaw17 "4yr Women Black or African American Count"
		label variable grbkaat17 "4yr Total Black or African American Count"
		label variable grbkaam17 "4yr Men Black or African American Count"
		label variable grhispw17 "4yr Women Hispanic Count"
		label variable grhispt17 "4yr Total Hispanic Count"
		label variable grhispm17 "4yr Men Hispanic Count"
		label variable grwhitw17 "4yr Women White Count"
		label variable grwhitt17 "4yr Total White Count"
		label variable grwhitm17 "4yr Men White Count"
		label variable grunknw17 "4yr Women Race/ethnicity Unknown Count"
		label variable grunknt17 "4yr Total Race/ethnicity Unknown Count"
		label variable grunknm17 "4yr Men Race/ethnicty Unknown Count"
		label variable grnralw17 "4yr Women Nonresident Alien Count"
		label variable grnralt17 "4yr Total Nonresident Alien Count"
		label variable grnralm17 "4yr Men Nonresident Alien Count"
		
		// Labels for 5 year graduation rate variables
		label variable grtotlw18 "5yr Women Grad Total Count"
		label variable grtotlt18 "5yr Grad Total Count"
		label variable grtotlm18 "5yr Men Grad Total Count"
		label variable graianw18 "5yr Women Amer. Ind. Or AK Native Count"
		label variable graiant18 "5yr Total Amer. Ind. Or AK Native Count"
		label variable graianm18 "5yr Men Amer. Ind. Or AK Native Count"
		label variable grasiaw18 "5yr Women Asian Count"
		label variable grasiat18 "5yr Total Asian Count"
		label variable grasiam18 "5yr Men Asian Count"
		label variable grbkaaw18 "5yr Women Black or African American Count"
		label variable grbkaat18 "5yr Total Black or African American Count"
		label variable grbkaam18 "5yr Men Black or African American Count"
		label variable grhispw18 "5yr Women Hispanic Count"
		label variable grhispt18 "5yr Total Hispanic Count"
		label variable grhispm18 "5yr Men Hispanic Count"
		label variable grwhitw18 "5yr Women White Count"
		label variable grwhitt18 "5yr Total White Count"
		label variable grwhitm18 "5yr Men White Count"
		label variable grunknw18 "5yr Women Race/ethnicity Unknown Count"
		label variable grunknt18 "5yr Total Race/ethnicity Unknown Count"
		label variable grunknm18 "5yr Men Race/ethnicty Unknown Count"
		label variable grnralw18 "5yr Women Nonresident Alien Count"
		label variable grnralt18 "5yr Total Nonresident Alien Count"
		label variable grnralm18 "5yr Men Nonresident Alien Count"
		
		// Labels for 6 year graduation rate variables
		label variable grtotlw19 "6yr Women Grad Total Count"
		label variable grtotlt19 "6yr Grad Total Count"
		label variable grtotlm19 "6yr Men Grad Total Count"
		label variable graianw19 "6yr Women Amer. Ind. Or AK Native Count"
		label variable graiant19 "6yr Total Amer. Ind. Or AK Native Count"
		label variable graianm19 "6yr Men Amer. Ind. Or AK Native Count"
		label variable grasiaw19 "6yr Women Asian Count"
		label variable grasiat19 "6yr Total Asian Count"
		label variable grasiam19 "6yr Men Asian Count"
		label variable grbkaaw19 "6yr Women Black or African American Count"
		label variable grbkaat19 "6yr Total Black or African American Count"
		label variable grbkaam19 "6yr Men Black or African American Count"
		label variable grhispw19 "6yr Women Hispanic Count"
		label variable grhispt19 "6yr Total Hispanic Count"
		label variable grhispm19 "6yr Men Hispanic Count"
		label variable grwhitw19 "6yr Women White Count"
		label variable grwhitt19 "6yr Total White Count"
		label variable grwhitm19 "6yr Men White Count"
		label variable grunknw19 "6yr Women Race/ethnicity Unknown Count"
		label variable grunknt19 "6yr Total Race/ethnicity Unknown Count"
		label variable grunknm19 "6yr Men Race/ethnicty Unknown Count"
		label variable grnralw19 "6yr Women Nonresident Alien Count"
		label variable grnralt19 "6yr Total Nonresident Alien Count"
		label variable grnralm19 "6yr Men Nonresident Alien Count"
		
	
		gen int isYr = `yindex'	                                        // Add the isYr index for later merge.
		order isYr, after(unitid)                                       // Order isYr after unitid, easier browsing.

		saveold "gr`yindex'_data_stata.dta", version(13) replace	    // Save cleaned data file.
		di `sp'	`sp'                                                    // Spacer for the output.
}

use GR2016_data_stata.dta, clear
forvalues yindex = 2015(-1)2002 {
	display "`yindex'"                                                  // Output for log file.
	append using "gr`yindex'_data_stata.dta", force
	di `sp'	                                                            // Spacing for log file.
}

	
// Move up file directory level, compress, add notes.
// Save resulting panel data set.
cd ..
compress
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





