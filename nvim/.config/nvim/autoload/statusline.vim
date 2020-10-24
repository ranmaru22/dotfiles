" STATUSLINE FUNCTIONS

" Add dynamic padding depending on sign and number column
function! statusline#pad() abort
    let l:signcol = 0
    if exists('+signcolumn') && &signcolumn
	let l:signcol = 2
    endif
    let l:min = 2
    let l:width=max([strlen(line('$')) + 1, &numberwidth, l:min]) + l:signcol
    let l:pad = repeat(" ", l:width)
    return l:pad
endfunction

" Show whether the git branch is ahead or behind [wip].
function! statusline#gitStatus() abort
    let [l:add, l:chn, l:del] = sy#repo#get_stats()
    return l:add || l:chn || l:del
endfunction

" Show the current git branch.
function! statusline#gitBranch() abort
    let l:gitstatus = statusline#gitStatus() ? "*" : ""
    return strlen(fugitive#head()) ? "  " . fugitive#head() . l:gitstatus . " ›› ": " "
endfunction

" Show a coloured bar based on the file status.
function! statusline#lhsIndicator()
    let l:pad = statusline#pad()
    let l:readonly = l:pad . (!&modifiable ? " " : &readonly ? " " : "  ")
    if &modifiable && &modified
	return '%#SLUnsaved#' . l:pad . " " . '%#SLUnsavedDelim#%*'
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
