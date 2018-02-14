set more off
clear all

// Build Public 4-Year Picker

use ipedsdirinfo15to16.dta, clear
keep if isYr == 2016
tab sector
tab sector, nol
keep if sector == 1
gen inst = instnm + " " + string(unitid)
sort inst city stabbr
keep stabbr city inst
order stabbr city inst
sort stabbr city inst
export delimited using highered_pub4yr_drill.csv, replace

// Build Private 4-Year Picker

use ipedsdirinfo15to16.dta, clear
keep if isYr == 2016
tab sector
tab sector, nol
keep if sector == 2
gen inst = instnm + " " + string(unitid)
sort inst city stabbr
keep stabbr city inst
order stabbr city inst
sort stabbr city inst
export delimited using highered_pri4yr_drill.csv, replace
