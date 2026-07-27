if exists("b:current_syntax")
    finish
endif

syn keyword machKeyword let var val const static pub fun inline typedef
syn keyword machKeyword export extern opaque embed register restrict
syn keyword machKeyword impl alias volatile async rec ext def
syn keyword machType bool char byte void string cstr str
syn keyword machType isize usize size
syn keyword machType int uint long ulong
syn keyword machType float double f32 f64 f128

syn keyword machLabel default ref deref
syn keyword machConstant true false nil
syn keyword machSComment assert
syn keyword machMacro std
"syn keyword machSMacro print alignof typeof
"syn match machSMacro '\v<(put|[e]?print|[e]?println||alignas|alignof|typeof|typeof_unequal)>'
"syn match machAdded '\v<(new|[m]?alloc)>'
"syn match machException '\v<(free)>'

syn keyword machSelf self
syn keyword machRepeat do while loop for in to
syn keyword machStatement brk cnt ret fin
syn keyword machConditional if or else elif match unless switch case
syn keyword machInclude include link when import

syn keyword machException throw try catch cast unsafe raw
syn keyword machPanic panic
"syn keyword machSuper   private

syn match machPreProc   '[@]'
syn match machSymbol    '[,;:\.]'
syn match machOperator  '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match machConstant  '[{}\[\]()]'
syn match machType      '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match machType      '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match machType      '\v<\w+_[tscemui]>'
syn match machMacro     '\v<[_]*\u[A-Z0-9_]*>'
syn match machType      '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
syn match machType      '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match machRepeat    '\v([^\.](\.|::|-\>))@<=\w\w*'
syn match machType      '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match machFunc      '\v[_]*\w+\ze((\[.*\])|((::)?\<.*\>))*\s*\('

syn match machException '\v(\W@<=[~*@!?]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[!]+\ze\W)'
syn match machException '\v\-\>'

syn match machType      '\v<[uif]\d+(x\d+)+>' "f64x6
syn match machAdded     '\v^\s*<(test)\ze\s+'
"syn match machInclude   '\v^<(use|fwd).*'
syn match machSComment  '\v\$(\w+)'
"syn match machSMacro    '\v<(result|option)\ze\s*\['
"syn match machMacro     '\v^\s*\[.{-}\]'
"syn match machType      '\v<(str)\ze\s*\('
""syn match machSMacro    '\v<(reduce|deref|list)\ze\s*\('
"syn match machLabel     '\v<(addr)\ze\s*\('

syn match machInclude "\v^\s*(use|fwd)" nextgroup=machRepeat,machString,machSymbol skipwhite
syn match machRepeat "\v\w+" contained nextgroup=machString,machSymbol,machRepeat skipwhite
"syn match machSymbol ":" contained nextgroup=machString,machRepeat skipwhite
syn match machString "\v(\w+\.)+" contained nextgroup=machRepeat skipwhite
syn match machString "\v:\s*(\w+(\.\w+)*)" contained

syn match machConstant contained /\v[\<,\>]/
syn region machConstantSpec
    \ oneline
    \ keepend
    \ contains=machType,machOperator,machMacro,machSComment,machConstant,machConstantSpec
    \ start=/\v\<\s*/
    \ end=/\v\s*\>/

" -- shader
"syn match   machKeyword  '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>\s'
"syn match   machType     '\v<(texture|texture2D)>\s'
syn match   machType     '\v<bool[234]?>'
syn match   machType     '\v<int[234]?>'
syn match   machType     '\v<uint[234]?>'
syn match   machType     '\v<half[234]?>'
syn match   machType     '\v<float([234](x[234])?)?>'
syn match   machType     '\v<[dbui]?vec[234]>'
syn match   machType     '\v<vec[234][dbfhui]?>'
syn match   machType     '\v<mat[234](x[234]f)?>'
syn match   machType     '\v<(vec|mat|list)\ze\['

"hi def machSymbol ctermfg=DarkGray guifg=DarkGray
hi def link machSMacro   SpecialComment
hi def link machTitle    Title
hi def link machAdded    Added
hi def link machConstant Constant
hi def link machSymbol   Changed
hi def link machMacro    Macro
hi def link machSComment SpecialComment
hi def link machFunc     Function
hi def link machTypedef  Changed
"hi def machType ctermfg=DarkCyan guifg=DarkCyan
hi def link machType     MoreMsg
"hi def machSelf ctermfg=DarkMagenta guifg=DarkMagenta
hi def link machSelf     Label
hi def link machModeMsg  ModeMsg

syn match  machSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  machSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  machCharacter        "'[^']*'" contains=machSpecialChar,machSpecialCharError
syn match  machCharacter        "'\\''" contains=machSpecialChar
syn match  machCharacter        "'[^\\]'"

"syn region    machString      matchgroup=machString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=machEscape,@Spell
syn region    machString      matchgroup=machString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    machString      matchgroup=machString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match machNumber "\v<[0-9_]+>"
syn match machNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match machNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match machFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match machFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match machInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match machInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match machInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match machInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match machFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match machFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match machFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match machFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match machEscape '\\[\\'"0abfnrtv]' contained display
syn match machEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match machFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=machEscape display
syn match machFormat '{{\|}}' contained display


hi def link machPreProc               PreProc
hi def link machSuper                 Title
hi def link machFloat                 Constant
hi def link machInteger               Number
hi def link machEscape                SpecialComment
hi def link machFormat                SpecialChar

hi def link machKeyword               Keyword
hi def link machInclude               Include
hi def link machLabel                 Label
hi def link machConditional           Conditional
hi def link machRepeat                Repeat
hi def link machStatement             Statement
"hi def link machType                  Type
hi def link machNumber                Number
hi def link machComment               Comment
hi def link machOperator              Operator
hi def link machCharacter             Character
hi def link machString                String
hi def link machTodo                  Todo
hi def link machSpecial               Special
hi def link machSpecialError          Error
hi def link machSpecialCharError      Error
hi def link machString                String
hi def link machCharacter             Character
hi def link machSpecialChar           SpecialChar
hi def link machException             Exception
hi def link machPanic                 Exception

syn match   machTypedef "\h\w*" display contained
syn match   machFunc "\h\w*" display contained
"syn keyword machKeyword union struct enum type nextgroup=machTypedef skipwhite skipempty
syn keyword machKeyword union struct enum trait nextgroup=machTypedef skipwhite 
"syn keyword machKeyword union nextgroup=machTypedef skipwhite skipempty contained
"syn keyword machMacro platform macro nextgroup=machTypedef skipwhite skipempty
syn keyword machKeyword fun nextgroup=machFunc skipwhite
" adapted from neovim runtime/syntax
syn keyword machTodo contained TODO FIXME XXX NOTE
"syn region  machComment  start="/\*" end="\*/" contains=machTodo,@Spell
"syn match   machComment  "//.*$" contains=machTodo,@Spell
"syn match   machSymbol   "\\\\.*$"
"syn match   machPreProc  '\#.*$'
syn match   machComment  '\v\#.*$' contains=machTodo,@Spell
syn match   machPreProc  '\v^\#\s*[\[].*$'


let b:current_syntax = "mach"
