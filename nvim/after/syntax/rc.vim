syn region rcString		start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rcSpecial
syn match rcNumber		"\<\d\+\(u\=l\=\|lu\|f\)\>"
"floating point number, with dot, optional exponent
syn match rcFloat		"\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, starting with a dot, optional exponent
syn match rcFloat		"\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match rcFloat		"\<\d\+e[-+]\=\d\+[fl]\=\>"
"hex number
syn match rcNumber		"\<0x[0-9a-f]\+\(u\=l\=\|lu\)\>"
syn match VariableKey   /^#.*/
" syntax match rcPath   #/\+\s#
" syn region rcPath		start=+/+ skip=+\\\\\|\\"+ end=+\n+ contains=rcSpecial

syn keyword SetGroup setEnv setGrid setVersion testSane setAlias setDep fileRead runDeploy unsetEnv testDev
syn keyword ConditionalsGroup ifSet elseTest endTest osGt osLt ifVersion elseIf fileTest
syn keyword VariablesGroup SB_PATH SBCAP_PATH __SBCAP LD_LIBRARY_PATH exists version custom
syn keyword CommonNames verdir appdir bin miniconda envs mamba extlib _extlib capsules python

syntax match UPPERCASE /[A-Z]/

hi link SetGroup Function
hi link ConditionalsGroup Conditional
hi link VariablesGroup Todo
hi link UPPERCASE DiagnosticError
hi link rcString Character
hi link rcPath Number
hi link rcFloat Float
hi link rcNumber Number
hi link VariableKey Comment
hi link CommonNames DiagnosticError

