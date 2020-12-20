" STATUSLINE FUNCTIONS

let s:modemap={
   \ 'n'  : '%#UserGreen#NORMAL%*',
   \ 'v'  : '%#UserYellow#VISUAL%*',
   \ 'V'  : '%#UserYellow#V-LINE%*',
   \ '' : '%#UserYellow#V-BLOCK%*',
   \ 'i'  : '%#UserBlue#INSERT%*',
   \ 'R'  : '%#UserRed#REPLACE%*',
   \ 'Rv' : '%#UserRed#V-REPL%*',
   \ 'c'  : '%#UserTeal#COMMAND%*',
   \}

" Return whether the git branch is ahead or behind and change stats.
function! statusline#gitStatus() abort
    let [l:add, l:chn, l:del] = sy#repo#get_stats()
    return { 
       \ 'stats': l:add > 0 ? ('%#UserGreen#+' . l:add . '%* ') : ""
	      \ . l:chn > 0 ? ('%#UserBlue#~' . l:chn . '%* ') : ""
	      \ . l:del > 0 ? ('%#UserRed#-' . l:del . '%* ') : "",
       \ 'changed': l:add || l:chn || l:del 
       \ }
endfunction

" Show the current git branch.
function! statusline#gitBranch() abort
    let l:gitstatus = statusline#gitStatus()
    let l:has_changed = l:gitstatus.changed ? "*" : ""
    return strlen(fugitive#head()) ? ' %#UserGreen# ' . fugitive#head() . l:has_changed . '%*' : ""
endfunction

" Show the current git branch.
function! statusline#gitStats() abort
    let l:gitstatus = statusline#gitStatus()
    let l:stats = substitute(l:gitstatus.stats, '^\s\+\|\s\+$', '', 'g')
    return l:gitstatus.changed ? ' %1*[%*' . l:stats . '%1*]%*' : ""
endfunction

" Show a coloured mode indicator
function! statusline#modeIndicator() abort
    return s:modemap[mode()]
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
    return !l:isHelp && strlen(l:path) ? l:path . "/" : ""
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
