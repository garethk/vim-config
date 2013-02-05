function! PhpFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '[public|private|protected]+ function ') >= 0
        return ">2"
    elseif match(thisline, '^class') >= 0
        return ">1"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=PhpFolds()
