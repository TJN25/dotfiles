" RC Language Syntax File

" Clear previous syntax definitions
syntax clear

" Basic syntax elements
syn region rcString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rcSpecial
syn match rcNumber "\<\d\+\(u\=l\=\|lu\|f\)\>"
syn match rcFloat "\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match rcFloat "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match rcFloat "\<\d\+e[-+]\=\d\+[fl]\=\>"
syn match rcNumber "\<0x[0-9a-f]\+\(u\=l\=\|lu\)\>"
syn match rcComment "^#.*$"
syn match rcPath "\(/[a-zA-Z0-9_\-\.]\+\)\+"

" Command groups
syn keyword rcSetCommands setEnv setGrid setGrids setVersion addEnv unsetEnv setName customVersion 
syn keyword rcSetCommands setAlias unsetAlias setDep

syn keyword rcTestCommands testSane testDev runDeploy

syn keyword rcFileCommands fileRead fileTest addSub

syn keyword rcConditionals ifSet ifUnset ifVersion if64bit ifnot64bit ifarm64 ifnotarm64
syn keyword rcConditionals osGt osLt osEq elseIf elseTest endTest

syn keyword rcPrintCommands comment echoOut echoErr runIt versionRC

" Variables and special names
syn keyword rcSystemVars verdir appdir appvar appver appname rcfile
syn keyword rcSystemVars SB_PATH SBCAP_PATH __SBCAP APP_DEP_SET PATHS_FIRST SBCAP_METRICS

syn keyword rcEnvVars PATH PYTHONPATH LD_LIBRARY_PATH LIBRARY_PATH MANPATH INCLUDE
syn keyword rcEnvVars CPATH PKG_CONFIG_PATH PERL5LIB CLASSPATH DYLD_LIBRARY_PATH
syn keyword rcEnvVars PYTHONHOME JAVA_HOME CUDA_HOME CUDA_PATH

syn keyword rcCommonNames bin miniconda envs mamba extlib _extlib capsules python
syn keyword rcCommonNames custom version exists

" Link syntax groups to highlighting
hi def link rcString String
hi def link rcNumber Number
hi def link rcFloat Float
hi def link rcComment Comment
hi def link rcPath Special

hi def link rcSetCommands Function
hi def link rcTestCommands PreProc
hi def link rcFileCommands Include
hi def link rcConditionals Conditional
hi def link rcPrintCommands Statement

hi def link rcSystemVars Type
hi def link rcEnvVars Identifier
hi def link rcCommonNames Constant

" Special highlighting for uppercase identifiers (often variables)
syn match rcUppercase /\<[A-Z][A-Z0-9_]*\>/
hi def link rcUppercase Identifier

