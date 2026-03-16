if exists('b:did_indent')
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetReamakeIndent()
setlocal indentkeys=o,O,0],0},<:>

if exists('*GetReamakeIndent')
    finish
endif

function! GetReamakeIndent() abort
    let l:shift = get(g:, 'reamake_indent_width', &shiftwidth)

    " Current line
    let l:cline = getline(v:lnum)

    " Find previous nonblank line
    let l:prevlnum = prevnonblank(v:lnum - 1)
    if l:prevlnum == 0
        return 0
    endif

    let l:prevline = getline(l:prevlnum)
    let l:ind = indent(l:prevlnum)

    " Dedent current line if it starts with a closing token
    if l:cline =~# '^\s*[]}]'
        let l:ind -= l:shift
    endif

    " Increase indent after lines opening a block
    if l:prevline =~# '\[\s*$'
        let l:ind += l:shift
    endif
    if l:prevline =~# '{\s*$'
        let l:ind += l:shift
    endif

    " Never go below 0
    return max([l:ind, 0])
endfunction
