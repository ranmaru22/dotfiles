" UTILITY FUNCTIONS

function! utils#foldtext() abort
    let l:linecount = "[" . (v:foldend - v:foldstart + 1) . "ℓ]"
    let l:line = getline(v:foldstart)
    return l:line . ' ... ' . l:linecount
endfunction

