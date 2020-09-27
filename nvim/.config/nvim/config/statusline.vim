" STATUSLINE SETTINGS

" Modes {{{
let g:mode={
       \ 'n':  'NORMAL',
       \ 'v':  'VISUAL',
       \ 'V':  'V-LINE',
       \ '': 'V-BLOCK',
       \ 'i':  'INSERT',
       \ 't':  'TERM',
       \ 'R':  'REPLACE',
       \ 'Rv': 'V-REPL',
       \ 'c':  'COMMAND',
       \}
" }}}

" Functions {{{
function! GitBranch()
	let ahead = strlen(get(b:, "coc_git_status", "")) ? "!" : ""
	return strlen(fugitive#head()) ? "‹‹ \uF418 " . fugitive#head() . ahead . " ››" : "|"
endfunction 

function! Filename()
	let modified = &filetype == "help" ? "" : &modified ? " \uF448" : &modifiable ? "" : " \uF8EE"
	return expand('%') . modified
endfunction
" }}}

" Statusline {{{
if has('statusline')
	set statusline=
	set statusline+=\ %{g:mode[mode()]}
	set statusline+=\ %{GitBranch()} 
	set statusline+=\ %<%{Filename()}
	set statusline+=\ %y
	set statusline+=%=
	set statusline+=\ \-\ %2l/%02c\ \|
	set statusline+=\ %3p%%\ -
	set statusline+=\ %{ObsessionStatus()}
	set statusline+=\ 
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
