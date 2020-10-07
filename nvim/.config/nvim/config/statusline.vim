" STATUSLINE SETTINGS

" Modes {{{
hi SLDark ctermfg=007 ctermbg=NONE guifg=fgcolor guibg=NONE gui=NONE cterm=NONE
hi SLDarkBold ctermfg=007 ctermbg=NONE guifg=fgcolor guibg=NONE gui=bold cterm=bold

let g:mode_map={
    \ 'n': 'NORMAL', 'no': 'N-OP', 'v': 'VISUAL', 'V': 'V-LINE',
    \ '': 'V-BLOCK', 'i': 'INSERT', 's': 'SELECT', 'S': 'S-LINE',
    \ '': 'S-BLOCK', 'R': 'REPLACE', 'Rv': 'V-REPL', 'c': 'COMMAND',
    \ 't': 'TERM', 'cv': 'VIM-EX', 'ce': 'EX', 'r': 'PROMPT', 
    \ 'rm': 'MORE', 'r?': 'CONFIRM', '!': 'SHELL',
    \}
" }}}

" Set statusline {{{
function! SetStatusLine(which)
    let statusline = ""
    if a:which == "active" && &modifiable
	let statusline.="%{ObsessionStatus()}"
	let statusline.="%#SLDarkBold# %{g:mode_map[mode()]} %*"
	let statusline.="%{statusline#gitBranch()}"
    endif
    let statusline.="%<%{statusline#filename()}%y%{statusline#spellLang()}%="
    if a:which == "active"
	let statusline.="%{statusline#lspStatus()}"
	let statusline.=" %#SLDark# ‹‹ %2l/%02L :: %02v ›› %*"
    endif
    return statusline
endfunction
" }}}

if has('statusline')
    au WinEnter * setlocal statusline=%!SetStatusLine('active')
    au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
    set statusline=%!SetStatusLine('active')
endif

" vim:foldmethod=marker:foldlevel=0
