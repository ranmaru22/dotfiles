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

" Component functions {{{
function! GitBranch()
	let [add, chn, del] = sy#repo#get_stats()
	let status = add || chn || del ? "*" : ""
	return strlen(fugitive#head()) ? " ‹‹" . fugitive#head() . status . "›› " : ""
endfunction

function! Filename()
	let readonly = &readonly ? "[RO]" : "" . !&modifiable ? "[-]" : ""
    let filename = strlen(expand('%')) ? pathshorten(fnamemodify(expand('%'), ":~:.")) . " " : ""
	let modified = &filetype == "help" ? "" : &modifiable && &modified ? "[+]" : ""
    return filename . modified . readonly
endfunction

function! SpellLang()
    return &spell ? "[" . &spelllang . "]" : ""
endfunction

function! LspStatus() abort
	if luaeval('#vim.lsp.buf_get_clients() > 0')
		return luaeval("require('lsp-status').status()")
	endif
	return ""
endfunction
" }}}

" Set statusline {{{
function! SetStatusLine(which)
	let statusline = " "
	if a:which == "active" && &modifiable
		let statusline.="%{&buflisted ? bufnr('%') : ''} "
		let statusline.="%#SLDarkBold# %{g:mode_map[mode()]} %*"
		let statusline.="%{GitBranch()}"
	endif
	let statusline.="%<%{Filename()}%y%{SpellLang()}%="
	if a:which == "active"
		let statusline.="%{LspStatus()}"
		let statusline.=" %#SLDark# ‹‹ %2l/%02L :: %02v ›› %*"
	endif
	let statusline.="%{ObsessionStatus()}"
	return statusline
endfunction

if has('statusline')
	au WinEnter * setlocal statusline=%!SetStatusLine('active')
	au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
	set statusline=%!SetStatusLine('active')
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
