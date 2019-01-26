*! 1.0.0 Adam Ross Nelson // GitHub Build
*! Original author : Adam Ross Nelson
*! Description: Standardizes a string across a panel.
*! Example:
*! UNITID    NAME      YEAR     METADATA
*!  11       Sam       16       897.9
*!  11       Sammy     17       234.1
*!  11       Sam       18       534.0
*!  11       Samantha  19       283.7
*!  12       Edward    16       910.9
*!  12       Eddy      17       255.1
*!  12       Edd       18       599.0
*!  12       Ed        19       233.7
*!
*! UNITID    NAME      YEAR     METADATA
*!  11       Samantha  16       897.9
*!  11       Samantha  17       234.1
*!  11       Samantha  18       534.0
*!  11       Samantha  19       283.7
*!  12       Ed        16       910.9
*!  12       Ed        17       255.1
*!  12       Ed        18       599.0
*!  12       Ed        19       233.7

capture program drop stdstring
program define stdstring

     // Version control
     version 15
     
     // Syntax requres one argument, must be text type variable.
     syntax varlist(min=2 max=2) [if] [in] [, GEN(string)]

     tokenize "`varlist'"
     
     gen `gen' = `2'
     
     bysort `1' : replace `gen' = `gen'[_N]

end
