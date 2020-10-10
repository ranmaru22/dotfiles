" STATUSLINE FUNCTIONS

function! statusline#highlight(guicol, ctermcol) abort
    execute printf("hi! Statusline ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.bg, a:ctermcol.fg, a:guicol.bg, a:guicol.fg)
    execute printf("hi! User1 ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.bg, a:ctermcol.muted, a:guicol.bg, a:guicol.muted)
    execute printf("hi! User2 ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.fg, a:ctermcol.bg, a:guicol.fg, a:guicol.bg)
    execute printf("hi! User3 ctermbg=%s ctermfg=%s guibg=%s guifg=%s cterm=bold gui=bold",
	\ a:ctermcol.bg, a:ctermcol.fg, a:guicol.bg, a:guicol.fg)
    execute printf("hi! User4 ctermbg=%s ctermfg=%s guibg=%s guifg=%s cterm=italic gui=italic",
	\ a:ctermcol.bg, a:ctermcol.muted, a:guicol.bg, a:guicol.muted)
    execute printf("hi! SLSaved ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.saved, a:ctermcol.bg, a:guicol.saved, a:guicol.bg)
    execute printf("hi! SLUnsaved ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.unsaved, a:ctermcol.bg, a:guicol.unsaved, a:guicol.bg)
    execute printf("hi! SLSavedDelim ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.bg, a:ctermcol.saved, a:guicol.bg, a:guicol.saved)
    execute printf("hi! SLUnsavedDelim ctermbg=%s ctermfg=%s guibg=%s guifg=%s",
	\ a:ctermcol.bg, a:ctermcol.unsaved, a:guicol.bg, a:guicol.unsaved)
endfunction

" Show whether the git brach is ahead or behind [wip].
function! statusline#gitStatus() abort
    let [l:add, l:chn, l:del] = sy#repo#get_stats()
    return l:add || l:chn || l:del
endfunction

" Show the current git branch.
function! statusline#gitBranch() abort
    let l:gitstatus = statusline#gitStatus() ? "*" : ""
    return strlen(fugitive#head()) ? "  " . fugitive#head() . l:gitstatus . " ›› ": ""
endfunction

" Show a coloured bar based on the status.
function! statusline#lhsIndicator()
    let l:readonly = !&modifiable ? "  " : &readonly ? "  " : "   "
    if &modifiable && &modified
	return '%#SLUnsaved#'. "  " . '%#SLUnsavedDelim#%*'
    else 
	return '%#SLSaved#' . l:readonly . '%#SLSavedDelim#%*'
    endif
endfunction

" Show the current filename plus additional information.
function! statusline#filepath()
    let l:path = pathshorten(fnamemodify(expand('%:p:h'), ":~:.")) 
    return strlen(l:path) ? l:path . "/" : " "
endfunction

function! statusline#filename()
    return strlen(expand('%')) ? expand('%:t') : "[No Name]"
endfunction

" Show spelling language if spell is turned on.
function! statusline#spellLang()
    return &spell ? "[" . &spelllang . "]" : ""
endfunction

" Show current LSP status.
function! statusline#lspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
	return luaeval("require('lsp-status').status()")
    endif
    return ""
endfunction
