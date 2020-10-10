" STATUSLINE SETTINGS

" Colours {{{
let s:sl_colours_gui = {
    \ "bg":      "#222222",
    \ "fg":      "#c2c2b0",
    \ "muted":   "#525b5b",
    \ "saved":   "#719611",
    \ "unsaved": "#aa4450",
    \ }
let s:sl_colours_cterm = {
    \ "bg":      "236",
    \ "fg":      "LightGrey",
    \ "muted":   "Grey",
    \ "saved":   "DarkGreen",
    \ "unsaved": "DarkRed",
    \ }
" }}}

" Set statusline {{{
" 1* Muted, 2* Inverse, 3* Bold, 4* Muted Italic
function! SetStatusLine(which)
    let l:statusline=""
    if a:which == "active" 
	let l:statusline.=statusline#lhsIndicator()
	let l:statusline.="%{statusline#gitBranch()}"
	let l:statusline.="%<%1*%{statusline#filepath()}"
	let l:statusline.="%3*%{statusline#filename()}%* "
	let l:statusline.="%4*%y%{statusline#spellLang()}%*%="
	let l:statusline.="%{statusline#lspStatus()}"
	let l:statusline.="%2* ℓ %2l/%02L c %02v "
	let l:statusline.="%{ObsessionStatus()}"
    elseif a:which == "inactive"
	let l:statusline.="%< %{statusline#filepath()}"
	let l:statusline.="%{statusline#filename()} "
	let l:statusline.="%y%{statusline#spellLang()}%="
    endif
    return l:statusline
endfunction
" }}}

if has('statusline')
    " Set the colours & reset them when changing the scheme
    execute statusline#highlight(s:sl_colours_gui, s:sl_colours_cterm)
    au ColorScheme * call statusline#highlight(s:sl_colours_gui, s:sl_colours_cterm)
    " Also reset colurs after leaving Goyo
    au User GoyoLeave nested call statusline#highlight(s:sl_colours_gui, s:sl_colours_cterm)
    " Switch between active and inactive statuslines
    au WinEnter * setlocal statusline=%!SetStatusLine('active')
    au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
    set statusline=%!SetStatusLine('active')
endif

" vim:foldmethod=marker:foldlevel=0
