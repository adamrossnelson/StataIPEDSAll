// ---------------------------------------------------------------------------
//
//    OVERVIEW:
//    As delivered from NCES OPEID is a variable that does not support a 
//    merge with other data sources. This is because some institutions
//    share OPEID numbers across multiple branches (even while unitid) is
//    unique.
//    SOLUTION:
//    This code selectively eliminates duplicate OPEIDs so that it is possible
//    to use OPEID in a data merge. Making available for other researchers.
//    CAUTION:
//    Carefully review the code for yourself before using. There is no 
//    garantee that the drops that serve one reserach or analytical purpose
//    will generalize to also serve other research or analytical purposes.
//
//
//    ALTERNATIVE: https://nscresearchcenter.org/workingwithourdata/) -- 
//                 https://nscresearchcenter.org/wp-content/uploads/NSC_SCHOOL_CODE_TO_IPEDS_UNIT_ID_XWALK.xlsx)
//-----------------------------------------------------------------------------

set more off
clear all
cd c:\statadata
use IPEDSDirInfo02to18.dta

// Remove administrative units (reduces many duplicates).
numlabel, add
tab sector
drop if sector == 0

// Drop where OPEID is missinog (Removes many duplicates).
replace opeid = subinstr(opeid," ","",.)
drop if opeid == ""
drop if opeid == "-2"

// Remove institutions that are "closed, combined, or out-of-scope."
drop if cyactive == 3

// Establish a toDrop tag.
gen toDrop = 0

// ----------------------------------------------------------------------------
// SOME SCHOOLS HAVE AN OPEID ASSOCIATED WITH BOTH A MAIN CAMPUS AND A
// SECONDARY CAMPUS (e.g. ONLINE, GLOBAL). KEEP MAIN CAMPUSES. WHICH OBS
// IS "MAIN" INFERED FROM INSTNM.
// ----------------------------------------------------------------------------
// Institutional drops that elimimated duplicate opeid.
// Drop "American College of Traditional Chinese Medicine" & Keep "Pacific Lutheran Theological Seminary"
replace toDrop = 1 if unitid == 430591
// Drop "Strayer University-Global Region" & Keep "Strayer University-District of Columbia"
replace toDrop = 1 if unitid == 459994
// Drop "Florida Institute of Technology-Online" & Keep "Florida Institute of Technology"
replace toDrop = 1 if unitid == 480569
// Drop "Embry-Riddle Aeronautical University-Worldwide" & Keep "Embry-Riddle Aeronautical University-Daytona Beach"
replace toDrop = 1 if unitid == 426314
// Drop "University of Florida-Online" & Keep "University of Florida"
replace toDrop = 1 if unitid == 484473
// Drop "Indiana Institute of Technology-College of Professions Studies" & Keep "Indiana Institute of Technology"
replace toDrop = 1 if unitid == 492962
// Drop "Purdue University Northwest" & Keep "Purdue University-Calumet Campus"
replace toDrop = 1 if unitid == 490805
// Drop "Ottawa University-Online" & Keep "Ottawa University-Ottawa"
replace toDrop = 1 if unitid == 454582
// Drop "Southern University Law Center" & Keep "Southern University and A & M College"
replace toDrop = 1 if unitid == 440916
// Drop "Northeastern University Lifelong Learning Network" & Keep "Northeastern University"
replace toDrop = 1 if unitid == 482705
// Drop "Springfield College-School of Professional and Continuing Studies" & Keep "Springfield College"
replace toDrop = 1 if unitid == 475273
// Drop "Central Methodist University-College of Graduate and Extended Studies" & Keep "Central Methodist University-College of Liberal Arts and Sciences"
replace toDrop = 1 if unitid == 445267
// Drop "Drury University-College of Continuing Professional Studies" & Keep "Drury University"
replace toDrop = 1 if unitid == 492801
// Drop "Bryant & Stratton College-Online" & Keep "Bryant & Stratton College-Southtowns"
replace toDrop = 1 if unitid == 480091
// Drop "Linfield College-Online and Continuing Education" & Keep "Linfield College-McMinnville Campus"
replace toDrop = 1 if unitid == 437325
// Drop "Warner Pacific College Adult Degree Program" & Keep "Warner Pacific College"
replace toDrop = 1 if unitid == 480198
// Drop "Elizabethtown College School of Continuing and Professional Studies" & Keep "Elizabethtown College"
replace toDrop = 1 if unitid == 480134
// Drop "Pennsylvania State University-World Campus" & Keep "Pennsylvania State University-Main Campus"
replace toDrop = 1 if unitid == 479956
// Drop "Saint Vincent Seminary" & Keep "Saint Vincent College"
replace toDrop = 1 if unitid == 215813
// Drop "Johnson & Wales University-Online" & Keep "Johnson & Wales University-Providence"
replace toDrop = 1 if unitid == 460349
// Drop "Brite Divinity School" & Keep "Texas Christian University"
replace toDrop = 1 if unitid == 450304
// Drop "Averett University-Non-Traditional Programs" & Keep "Averett University"
replace toDrop = 1 if unitid == 449931
// Drop "Northwest University-College of Adult and Professional Studies" & Keep "Northwest University"
replace toDrop = 1 if unitid == 487603
// Drop "Whitworth University-Adult Degree Programs" & Keep "Whitworth University"
replace toDrop = 1 if unitid == 475200
// Drop "University of Wisconsin-Milwaukee Flex" & Keep "University of Wisconsin-Milwaukee"
replace toDrop = 1 if unitid == 491288
// Drop "University of Wisconsin Colleges Flex" & Keep "University of Wisconsin Colleges"
replace toDrop = 1 if unitid == 491303
// Drop "University of Wisconsin-Parkside Flex" & Keep "University of Wisconsin-Parkside"
replace toDrop = 1 if unitid == 491297
// Drop "Chamberlain College of Nursing-Jacksonville Campus" & Keep "Chamberlain College of NursingColumbus Campus"
replace toDrop = 1 if unitid == 457129
// Drop "The Art Institute of Pittsburgh-Online Division" & Keep "The Art Institute of Pittsburgh"
replace toDrop = 1 if unitid == 451662
// Drop "Daymar College-Online" & Keep "Daymar College-Louisville"
replace toDrop = 1 if unitid == 458557
// Drop "South UniversitySavannah Online" & Keep "South University-Savannah"
replace toDrop = 1 if unitid == 475121
// Drop "Capri Beauty College New Lenox I" & Keep "Capri Oak Forest Beauty College"
replace toDrop = 1 if unitid == 457031
// Drop "CoxHealth School of Diagnostic Medical Sonography" & Keep "Cox College"
replace toDrop = 1 if unitid == 442514
// Drop "Argosy University-Phoenix Online Division" & Keep "Argosy University-Phoenix"
replace toDrop = 1 if unitid == 456348
// Drop "American Broadcasting School-Online Program" & Keep "American Broadcasting School-Oklahoma City"
replace toDrop = 1 if unitid == 475255
// Drop "Sanford-Brown College-Online" & Keep "Sanford-Brown College-Tampa"
replace toDrop = 1 if unitid == 456296
// Drop "Maric College-Panorama City" & Keep "Maric College-Anaheim"
replace toDrop = 1 if unitid == 424424
// Drop "COMPUTER-ED INSTITUTE-LINCOLN" & Keep "COMPUTER-ED INSTITUTE"
replace toDrop = 1 if unitid == 433101
// Drop "Blue Cliff College-Shreveport" & Keep "Blue Cliff College"
replace toDrop = 1 if unitid == 450119
// Drop "Blue Cliff College-Lafayette" & Keep "Blue Cliff College"
replace toDrop = 1 if unitid == 439491
// Drop "Tricoci University of Beauty Culture-Janesville" & Keep "Academy of Cosmetology"
replace toDrop = 1 if unitid == 491224

// ----------------------------------------------------------------------------
// SOME SCHOOLS APPEAR TO BE DUPLICATES. GIVEN THEIR SPARCITY THEY CAN
// BE REMOVED WITH LITTLE IMPACT ON NATIONAL OR OTHER LARGE SCALE ANALYSES.
// ----------------------------------------------------------------------------
// Drop "EMPIRE BEAUTY SCHOOL" (only occurs once in 2003)
replace toDrop = 1 if inlist(unitid,212753,438878)
// Drop "Bohecker College-Cincinnati" (Dup Names Nonexisting before after 2009/2010)
replace toDrop = 1 if inlist(unitid,450058,450067)
// Drop "FEGS TRADES AND BUSINESS SCHOOL" (only occurs once in 2003)
replace toDrop = 1 if inlist(unitid,375009,191153)
// Drop "Dewey University-Hato Rey" (Dup Names Nonexisting before after 2016/2017)
replace toDrop = 1 if inlist(unitid,431309,443562)
// Drop "Onondaga School of Therapeutic Massage" (Dup Names Nonexisting before after 2010)
replace toDrop = 1 if inlist(unitid,457846,460455)

// Drop tagged observations.
drop if toDrop == 1

// Check for duplicates
duplicates tag opeid isYr, gen(isDup)

