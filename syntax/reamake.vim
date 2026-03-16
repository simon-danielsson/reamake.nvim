if exists('b:current_syntax')
    finish
endif

syntax case match

" Comments
syntax match reamakeComment /#.*/ contains=reamakeTodo
syntax keyword reamakeTodo TODO FIXME NOTE XXX contained

" Strings
syntax region reamakeString start=/"/ skip=/\\"/ end=/"/ contains=reamakeVarRef,reamakeBuiltinVar

" Escapes
syntax match reamakeEscape /\\./ contained containedin=reamakeString

" Booleans
syntax keyword reamakeBoolean true false

" Top-level section keywords
syntax keyword reamakeSection variables settings hierarchy

" Data types
syntax keyword reamakeType string file folder

" Built-in variable names in declarations/comments/strings
syntax keyword reamakeBuiltin date
syntax match reamakeBuiltinVar /\$date\>/ contained containedin=reamakeString

" Variable references like $client, $project
syntax match reamakeVarRef /\$[A-Za-z_][A-Za-z0-9_]*/ contained containedin=reamakeString

" Declaration keys before :
syntax match reamakeIdentifier /^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s*:/

" Settings keys before :
syntax match reamakeSettingKey /^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s*:/

" Assignment operator
syntax match reamakeOperator /[:=]/

" Delimiters / block chars
syntax match reamakeDelimiter /[\[\]{}]/

" Hierarchy item keywords at line start
syntax keyword reamakeNode folder file rpp stems

" Numbers / dates inside strings aren't parsed specially, but this catches bare numerics
syntax match reamakeNumber /\v<\d+>/

" Paths are just strings in this language, so strings already cover them.

hi def link reamakeComment       Comment
hi def link reamakeTodo          Todo
hi def link reamakeString        String
hi def link reamakeEscape        SpecialChar
hi def link reamakeBoolean       Boolean
hi def link reamakeSection       Keyword
hi def link reamakeType          Type
hi def link reamakeBuiltin       Special
hi def link reamakeBuiltinVar    Special
hi def link reamakeVarRef        Identifier
hi def link reamakeIdentifier    Identifier
hi def link reamakeSettingKey    Identifier
hi def link reamakeOperator      Operator
hi def link reamakeDelimiter     Delimiter
hi def link reamakeNode          Statement
hi def link reamakeNumber        Number

let b:current_syntax = 'reamake'
