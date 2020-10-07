" STATUSLINE FUNCTIONS

" Show the current git branch and a marker whether the CWD is dirty.
function! statusline#gitBranch()
    let [add, chn, del] = sy#repo#get_stats()
    let status = add || chn || del ? "!" : ""
    return strlen(fugitive#head()) ? " ‹‹  " . fugitive#head() . status . "›› " : ""
endfunction

" Show the current filename plus additional information.
function! statusline#filename()
    let readonly = &readonly ? "[RO]" : "" . !&modifiable ? "[-]" : ""
    let filename = strlen(expand('%')) ? pathshorten(fnamemodify(expand('%'), ":~:.")) . " " : ""
    let modified = &filetype == "help" ? "" : &modifiable && &modified ? "[+]" : ""
    return filename . modified . readonly
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
