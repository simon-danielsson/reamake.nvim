if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetReamakeIndent(v:lnum)
setlocal indentkeys=o,O,*<Return>,],}

if exists("*GetReamakeIndent")
    finish
endif

function! GetReamakeIndent(lnum) abort
    let prevlnum = prevnonblank(a:lnum - 1)
    if prevlnum == 0
        return 0
    endif

    let prevline = getline(prevlnum)
    let thisline = getline(a:lnum)
    let ind = indent(prevlnum)

    " Dedent closing ] or }
    if thisline =~ '^\s*[]}]'
        let ind -= shiftwidth()
    endif

    " Indent after opening [ or {
        if prevline =~ '[\[{]\s*$'
            let ind += shiftwidth()
        endif

        return ind < 0 ? 0 : ind
    endfunction
