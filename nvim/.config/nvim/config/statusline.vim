" STATUSLINE SETTINGS

" Modes {{{
hi ObsStatus ctermbg=008 ctermfg=007 guibg=#b5b4c9 guibg=#5b5f71
hi SLMode ctermbg=None ctermfg=008 guibg=#2e313d guibg=fgcolor

let g:mode_map={
    \ 'n': 'NORMAL', 'no': 'N-OP', 'v': 'VISUAL', 'V': 'V-LINE',
    \ '': 'V-BLOCK', 'i': 'INSERT', 's': 'SELECT', 'S': 'S-LINE',
    \ '': 'S-BLOCK', 'R': 'REPLACE', 'Rv': 'V-REPL', 'c': 'COMMAND',
    \ 't': 'TERM', 'cv': 'VIM-EX', 'ce': 'EX', 'r': 'PROMPT', 
    \ 'rm': 'MORE', 'r?': 'CONFIRM', '!': 'SHELL',
    \}
" }}}

" Component functions {{{
function ColouredMode(mode)
	if a:mode =~# '\v(v|V|s|S||)'
		" Visual + Select modes
 		exe 'hi! SLMode ctermfg=004 ctermbg=236 guifg=#8296b0 guibg=#2e313d gui=bold cterm=bold'
	elseif a:mode =~# '\v(i)'
		" Insert mode
		exe 'hi! SLMode ctermfg=005 ctermbg=236 guifg=#a18daf guibg=#2e313d gui=bold cterm=bold'
	elseif a:mode =~# '\v(R|Rv)'
		" Replace modes 
		exe 'hi! SLMode ctermfg=001 ctermbg=236 guifg=#cf8164 guibg=#2e313d gui=bold cterm=bold'
	else
		" Everything else
		exe 'hi! SLMode ctermfg=008 ctermbg=236 guifg=fgcolor guibg=#2e313d gui=bold cterm=bold'
	endif
	return get(g:mode_map, a:mode, "")
endfunction

function! GitBranch()
	let ahead = strlen(get(b:, "coc_git_status", "")) ? "!" : ""
	return strlen(fugitive#head()) ? "‹‹ \uF418 " . fugitive#head() . ahead . " ›› " : ""
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

function! CocStatus() abort
    let status = get(g:, 'coc_status', '')
    return strlen(status) ? " " . status : ""
endfunction
" }}}

" Set statusline {{{
function! SetStatusLine(which)
	let statusline = ""
	if a:which == "active" && &modifiable
		let statusline.="\ %#SLMode#%{ColouredMode(mode())}%*"
		let statusline.="\ %{GitBranch()}%"
	endif
	let statusline.="<%{Filepath()}%{Filename()}\ %y%r%{SpellLang()}%="
	if a:which == "active"
		let statusline.="%{CocStatus()}"
		let statusline.="\ ‹‹\ %02l/%02L\ ::\ %02v\ ››\ "
		let statusline.="%{ObsessionStatus()}"
	endif
	return statusline
endfunction

if has('statusline')
	au WinEnter * setlocal statusline=%!SetStatusLine('active')
	au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
	set statusline=%!SetStatusLine('active')
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
