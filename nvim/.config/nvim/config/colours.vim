" COLOUR SETTINGS

set t_Co=256

if exists("+termguicolors")
    set termguicolors
endif

set background=dark
let ayucolor="dark"
colorscheme ayu

" Missing colours {{{
hi LspDiagnosticsDefaultError       guifg=#FF3333 ctermfg=009
hi LspDiagnosticsDefaultWarning     guifg=#F29718 ctermfg=003
hi LspDiagnosticsDefaultHint        guifg=#80a0ff ctermfg=006
hi LspDiagnosticsDefaultInformation guifg=#78c2ff ctermfg=005

" hi SignColumn        guibg=bg guifg=fg      ctermbg=NONE ctermfg=015
" hi SignifySignAdd    guibg=bg guifg=#8bbe67 ctermbg=NONE ctermfg=010
" hi SignifySignChange guibg=bg guifg=#c3b470 ctermbg=NONE ctermfg=005
hi SignifySignDelete guibg=bg guifg=#e07093 ctermbg=NONE ctermfg=009

" hi CursorLineNr guibg=#3a3a3a guifg=#fff000
" }}}

" Custom colours {{{
" hi StatusLine guibg=#14191F guifg=#d9d9d9 gui=NONE ctermbg=233 ctermfg=252 cterm=NONE

" 1* Muted, 2* Italic, 3* Bold, 4* Muted Italic, 5* Muted Bold
hi User1 guibg=#14191F guifg=#666666 gui=NONE   ctermbg=233 ctermfg=244 cterm=NONE
hi User2 guibg=#14191F guifg=#d9d9d9 gui=italic ctermbg=233 ctermfg=252 cterm=italic
hi User3 guibg=#14191F guifg=#d9d9d9 gui=bold   ctermbg=233 ctermfg=252 cterm=bold
hi User4 guibg=#14191F guifg=#666666 gui=italic ctermbg=233 ctermfg=244 cterm=italic
hi User5 guibg=#14191F guifg=#666666 gui=bold   ctermbg=233 ctermfg=244 cterm=bold

hi UserGreen  guibg=#14191F guifg=#b8cc51 gui=bold ctermbg=233 ctermfg=010 cterm=bold
hi UserBlue   guibg=#14191F guifg=#36a3d8 gui=bold ctermbg=233 ctermfg=012 cterm=bold
hi UserYellow guibg=#14191F guifg=#ffee98 gui=bold ctermbg=233 ctermfg=011 cterm=bold
hi UserRed    guibg=#14191F guifg=#f07078 gui=bold ctermbg=233 ctermfg=009 cterm=bold
hi UserTeal   guibg=#14191F guifg=#95e6ca gui=bold ctermbg=233 ctermfg=014 cterm=bold
" }}}

" Highlight trailing whitespace {{{
hi TrailingWhitespace guifg=#51617d ctermfg=102
match TrailingWhitespace /\s\+$/
" }}}

" vim:foldmethod=marker
