" STATUSLINE SETTINGS

" Colours {{{
let s:sl_colours_gui = {
    \ "bg":      "#2e313d",
    \ "fg":      "#b5b4c9",
    \ "muted":   "#5b5f71",
    \ "saved":   "#76a065",
    \ "unsaved": "#cf8164",
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
    execute statusline#highlight(s:sl_colours_gui, s:sl_colours_cterm)
    au WinEnter * setlocal statusline=%!SetStatusLine('active')
    au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
    set statusline=%!SetStatusLine('active')
endif

" vim:foldmethod=marker:foldlevel=0
