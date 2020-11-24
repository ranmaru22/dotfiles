" STATUSLINE SETTINGS

" Set statusline {{{
" 1* Muted, 2* Inverse, 3* Bold, 4* Muted Italic, 5* Bold Inverse
function! SetStatusLine(which)
    let l:statusline=""
    if a:which == "active"
	let l:statusline.=statusline#lhsIndicator()
	let l:statusline.="%{statusline#gitBranch()}"
	let l:statusline.="%<%1*%{statusline#filepath()}"
	let l:statusline.="%3*%{statusline#filename()}%*"
	let l:statusline.="%{&modified ? '*' : ''} "
	let l:statusline.="%4*%y%{statusline#spellLang()}%*%="
	let l:statusline.="%2* %5*ℓ%2* %2l/%02L %5*c%2* %02v "
	let l:statusline.="%{ObsessionStatus()}"
    elseif a:which == "inactive"
	let l:statusline.="%< %{statusline#filepath()}"
	let l:statusline.="%{statusline#filename()}"
	let l:statusline.="%{&modified ? '*' : ''} "
	let l:statusline.="%y%{statusline#spellLang()}%="
    endif
    return l:statusline
endfunction
" }}}

if has('statusline')
    au WinEnter * setlocal statusline=%!SetStatusLine('active')
    au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
    set statusline=%!SetStatusLine('active')
endif

" vim:foldmethod=marker:foldlevel=0
