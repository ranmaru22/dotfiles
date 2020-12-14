" COLOUR SETTINGS

set t_Co=256

if exists("+termguicolors")
    set termguicolors
endif

set background=dark
let ayucolor="dark"
let g:edge_sign_column_background = 'none'
let g:edge_current_word = 'bold'
colorscheme edge

" Missing colours {{{
hi LspDiagnosticsDefaultError       guifg=#D71A1A ctermfg=009
hi LspDiagnosticsDefaultWarning     guifg=#F29718 ctermfg=003
hi LspDiagnosticsDefaultHint        guifg=#B7CBF4 ctermfg=006
hi LspDiagnosticsDefaultInformation guifg=#A9C1DE ctermfg=005

" hi SignColumn        guibg=bg guifg=fg      ctermbg=NONE ctermfg=015
" hi SignifySignAdd    guibg=bg guifg=#D8FA3B ctermbg=NONE ctermfg=010
" hi SignifySignChange guibg=bg guifg=#91AADF ctermbg=NONE ctermfg=004
" hi SignifySignDelete guibg=bg guifg=#FF0000 ctermbg=NONE ctermfg=009
" }}}

" Custom colours {{{
hi StatusLine guibg=#414453 guifg=#c5cdd9 gui=NONE ctermbg=233 ctermfg=252 cterm=NONE

" 1* Muted, 2* Italic, 3* Bold, 4* Muted Italic, 5* Muted Bold
hi User1 guibg=#414453 guifg=#88909f gui=NONE   ctermbg=233 ctermfg=244 cterm=NONE
hi User2 guibg=#414453 guifg=#c5cdd9 gui=italic ctermbg=233 ctermfg=252 cterm=italic
hi User3 guibg=#414453 guifg=#c5cdd9 gui=bold   ctermbg=233 ctermfg=252 cterm=bold
hi User4 guibg=#414453 guifg=#88909f gui=italic ctermbg=233 ctermfg=244 cterm=italic
hi User5 guibg=#414453 guifg=#88909f gui=bold   ctermbg=233 ctermfg=244 cterm=bold

hi UserGreen  guibg=#414453 guifg=#a0c980 gui=bold ctermbg=233 ctermfg=010 cterm=bold
hi UserBlue   guibg=#414453 guifg=#6cb6eb gui=bold ctermbg=233 ctermfg=012 cterm=bold
hi UserYellow guibg=#414453 guifg=#deb974 gui=bold ctermbg=233 ctermfg=011 cterm=bold
hi UserRed    guibg=#414453 guifg=#ec7279 gui=bold ctermbg=233 ctermfg=009 cterm=bold
hi UserTeal   guibg=#414453 guifg=#5dbbc1 gui=bold ctermbg=233 ctermfg=014 cterm=bold
" }}}

" Highlight trailing whitespace {{{
hi TrailingWhitespace guifg=#88909f ctermfg=008
match TrailingWhitespace /\s\+$/
" }}}

" vim:foldmethod=marker
