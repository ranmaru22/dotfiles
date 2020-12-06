" STATUSLINE FUNCTIONS

let s:modecolour={
   \ 'n'  : '%#UserGreen#',
   \ 'v'  : '%#UserYellow#',
   \ 'V'  : '%#UserYellow#',
   \ '' : '%#UserYellow#',
   \ 'i'  : '%#UserBlue#',
   \ 'R'  : '%#UserRed#',
   \ 'Rv' : '%#UserRed#',
   \ 'c'  : '%#UserTeal#',
   \}

" Show whether the git branch is ahead or behind [wip].
function! statusline#gitStatus() abort
    let [l:add, l:chn, l:del] = sy#repo#get_stats()
    return l:add || l:chn || l:del
endfunction

" Show the current git branch.
function! statusline#gitBranch() abort
    let l:gitstatus = statusline#gitStatus() ? "*" : ""
    return strlen(fugitive#head()) ? ' ‹‹%#UserGreen#  ' . fugitive#head() . l:gitstatus . '%* ›› ' : " "
endfunction

" Show a coloured mode indicator
function! statusline#modeIndicator() abort
    return ' ' . s:modecolour[mode()] . '⬤%*'
endfunction

" Show a coloured icon on the file status.
function! statusline#modified()
    let l:readonly = (!&modifiable ? "  " : &readonly ? "  " : " ")
    if &modifiable && &modified
	return "%#UserRed#  %*"
    endif
    return '%#UserBlue#' . l:readonly . '%*'
endfunction

" Show the current filepath plus additional information.
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
