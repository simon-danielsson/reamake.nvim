if exists('b:current_syntax')
    finish
endif

syntax case match

" comments
syntax match reamakeComment /#.*/ contains=reamakeTodo
syntax keyword reamakeTodo TODO FIXME NOTE XXX contained

" strings
syntax region reamakeString start=/"/ skip=/\\"/ end=/"/ contains=reamakeVarRef

" escapes
syntax match reamakeEscape /\\./ contained containedin=reamakeString

" booleans
syntax keyword reamakeBoolean true false

" top-level section keywords
syntax keyword reamakeSection variables settings hierarchy

" data types
syntax keyword reamakeType string file folder

" variable references like $client, $project
syntax match reamakeVarRef /\$[A-Za-z_][A-Za-z0-9_]*/ contained containedin=reamakeString

" declaration keys before colon
syntax match reamakeIdentifier /^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s*:/

" settings keys before colon
syntax match reamakeSettingKey /^\s*[A-Za-z_][A-Za-z0-9_]*\ze\s*:/

" hierarchy entries:
" first word on a line, unless it is folder, file, ] or }
syntax match reamakeHierarchyTypedName /^\s*\zs\%(folder\|file\|]\|}\)\@![A-Za-z_][A-Za-z0-9_]*/

" assignment operator
syntax match reamakeOperator /[:=]/

" delimiters / block chars
syntax match reamakeDelimiter /[\[\]{}]/

" catches bare numerics
syntax match reamakeNumber /\v<\d+>/

hi def link reamakeComment           Comment
hi def link reamakeTodo              Todo
hi def link reamakeString            String
hi def link reamakeEscape            SpecialChar
hi def link reamakeBoolean           Boolean
hi def link reamakeSection           Keyword
hi def link reamakeType              Type
hi def link reamakeVarRef            Identifier
hi def link reamakeIdentifier        Identifier
hi def link reamakeSettingKey        Identifier
hi def link reamakeHierarchyTypedName Type
hi def link reamakeOperator          Operator
hi def link reamakeDelimiter         Delimiter
hi def link reamakeNumber            Number

let b:current_syntax = 'reamake'
