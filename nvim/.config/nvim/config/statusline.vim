" STATUSLINE SETTINGS

" Set statusline {{{
function! SetStatusLine(which)
    let l:statusline=""
    if a:which == "active"
	" Left side
	" let l:statusline.=statusline#modeIndicator()
	let l:statusline.=statusline#gitBranch()
	let l:statusline.="%* ‹‹ "
	let l:statusline.="%<%1*"
	let l:statusline.=statusline#filepath()
	let l:statusline.=(&modifiable && &modified ? "%#UserRed#" : "%3*")
	let l:statusline.=statusline#filename()
	let l:statusline.="%*"
	let l:statusline.=statusline#modified()
	let l:statusline.="%4*%y"
	let l:statusline.=statusline#spellLang()
	let l:statusline.="%* ›› "
	" Right side
	let l:statusline.="%="
	let l:statusline.=statusline#lspStatus()
	let l:statusline.=" ‹‹ %3*ℓ%* %02l/%02L %3*c%* %02v ›› %#UserTeal#"
	let l:statusline.=ObsessionStatus()
	let l:statusline.=" %*"
    elseif a:which == "inactive"
	let l:statusline.="%<%m %f %y"
    endif
    return l:statusline
endfunction
" }}}

if has('statusline')
    au WinEnter * setlocal statusline=%!SetStatusLine('active')
    au WinLeave * setlocal statusline=%!SetStatusLine('inactive')
    set statusline=%!SetStatusLine('active')
endif

" vim:foldmethod=marker
