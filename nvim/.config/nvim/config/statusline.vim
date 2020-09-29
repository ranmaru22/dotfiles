" STATUSLINE SETTINGS

" Highlight groups {{{
hi ModeName ctermbg=0 cterm=bold guibg=#2e313d gui=bold
hi SLFileName ctermbg=0 cterm=bold guifg=#6c6f82 guibg=#2e313d gui=bold,italic
" }}}

" Modes {{{
let g:modes={
       \ 'n':	   'NORMAL',
       \ 'no':	   'N-OP',
       \ 'v':	   'VISUAL',
       \ 'V':      'V-LINE',
       \ '':     'V-BLOCK',
       \ 'i':	   'INSERT',
       \ 's':	   'SELECT',
       \ 'S':	   'S-LINE',
       \ '':     'S-BLOCK',
       \ 'R':	   'REPLACE',
       \ 'Rv':	   'V-REPL',
       \ 'c':	   'COMMAND',
       \ 't':	   'TERM',
       \ 'cv':	   'Vi-EX',
       \ 'ce':	   'EX',
       \ 'r':	   'PROMPT',
       \ 'rm':	   'MORE',
       \ 'r?':	   'CONFIRM',
       \ '!':	   'SHELL',
       \}
" }}}

" Functions {{{
function! GitBranch()
	let ahead = strlen(get(b:, "coc_git_status", "")) ? "!" : ""
	return strlen(fugitive#head()) ? "‹‹\uF418 " . fugitive#head() . ahead . "››" : "|"
endfunction

function! Filepath()
	return strlen(expand('%')) ? pathshorten(fnamemodify(expand('%:h'), ":~:.")) . "/" : ""
endfunction

function! Filename()
    let filename = strlen(expand('%')) ? expand('%:t') : "[New]"
	let modified = &filetype == "help" ? "" : &modified ? " \uF448" : &modifiable ? "" : " \uF8EE"
	return filename . modified
endfunction

function! SpellLang()
	return &spell ? "[" . &spelllang . "]" : ""
endfunction
" }}}

" Statusline {{{
if has('statusline')
	set statusline=
	set statusline+=%#ModeName#\ %{g:modes[mode()]}%*
	set statusline+=\ %{GitBranch()}
	set statusline+=\ %<%{Filepath()}%#SLFileName#%{Filename()}%*
	set statusline+=\ %y
	set statusline+=%r
	set statusline+=%{SpellLang()}
	set statusline+=%=
	set statusline+=\ %3l/%02L\ \|
	set statusline+=\ %02v\ 
	set statusline+=%{ObsessionStatus()}\ 
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
