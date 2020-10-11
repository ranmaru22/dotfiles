" STATUSLINE FUNCTIONS

" Show whether the git branch is ahead or behind [wip].
function! statusline#gitStatus() abort
    let [l:add, l:chn, l:del] = sy#repo#get_stats()
    return l:add || l:chn || l:del
endfunction

" Show the current git branch.
function! statusline#gitBranch() abort
    let l:gitstatus = statusline#gitStatus() ? "*" : ""
    return strlen(fugitive#head()) ? "  " . fugitive#head() . l:gitstatus . " ›› ": ""
endfunction

" Show a coloured bar based on the file status.
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
    let l:isHelp = &ft == "help" && !&modifiable
    return !l:isHelp && strlen(l:path) ? l:path . "/" : " "
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
