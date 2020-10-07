" STATUSLINE FUNCTIONS

" Show a coloured bar based on the mode
function! statusline#modeIndicator(which)
	if a:which == 'N'
		return '%#SLModeNormal# %*'
	elseif a:which == 'I'
		return '%#SLModeInsert# %*'
	elseif index(['v', 'V', '', 's', 'S', ''], a:which) >= 0
		return '%#SLModeVisual# %*'
	elseif index(['R', 'Rv'], a:which) >= 0
		return '%#SLModeReplace# %*'
	endif
	return ""
endfunction

" Show the current git branch and a marker whether the CWD is dirty.
function! statusline#gitBranch()
    let [add, chn, del] = sy#repo#get_stats()
    let l:status = add || chn || del ? "!" : ""
    return strlen(fugitive#head()) ? "‹‹  " . fugitive#head() . l:status . " ›› " : "| "
endfunction

" Show the current filename plus additional information.
function! statusline#filename()
    let l:readonly = &readonly ? "[RO]" : "" . !&modifiable ? "[-]" : ""
    let l:filename = strlen(expand('%')) ? pathshorten(fnamemodify(expand('%'), ":~:.")) . " " : ""
    let l:modified = &filetype == "help" ? "" : &modifiable && &modified ? "[+]" : ""
    return l:filename . l:modified . l:readonly
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
