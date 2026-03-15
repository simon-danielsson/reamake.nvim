if exists("b:current_syntax")
    finish
endif

syntax match reamakeComment /#.*/
syntax match reamakeSection /^\s*\zs\(variables\|settings\|hierarchy\)\ze\s*\[/
syntax match reamakeBracket /[\[\]{}]/
syntax keyword reamakeKeyword variables settings hierarchy
syntax match reamakeIdentifier /^\s*\zs[A-Za-z_][A-Za-z0-9_-]*\ze\s*:/
syntax match reamakeType /\v:\s*\zs(string|file|folder)\ze/
syntax match reamakeAssign /=/
syntax keyword reamakeBoolean true false
syntax match reamakeConstant /\v:\s*\zs(EU|US|ISO)\ze/
syntax region reamakeString start=/"/ skip=/\\"/ end=/"/
syntax match reamakeVariable /\$\h\w*/
syntax match reamakeVariable /\${[^}]\+}/
syntax match reamakeNumber /\v\<\d+(\.\d+)?\>/

highlight default link reamakeComment Comment
highlight default link reamakeSection Keyword
highlight default link reamakeBracket Delimiter
highlight default link reamakeKeyword Keyword
highlight default link reamakeIdentifier Identifier
highlight default link reamakeType Type
highlight default link reamakeAssign Operator
highlight default link reamakeBoolean Boolean
highlight default link reamakeConstant Constant
highlight default link reamakeString String
highlight default link reamakeVariable Special
highlight default link reamakeNumber Number

let b:current_syntax = "reamake"
