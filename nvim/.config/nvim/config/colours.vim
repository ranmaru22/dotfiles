" COLOUR SETTINGS

set background=dark
colorscheme doom-one

" Tweaks {{{
hi Function    gui=bold cterm=bold
hi Conditional gui=bold cterm=bold
hi Repeat      gui=bold cterm=bold
hi Label       gui=bold cterm=bold
hi Exception   gui=bold cterm=bold
hi Keyword     gui=bold cterm=bold
" }}}

" Missing colours {{{
hi SignifySignAdd             guibg=#282c34 guifg=#98be65
hi SignifySignChange          guibg=#282c34 guifg=#51afef
hi SignifySignDelete          guibg=#282c34 guifg=#ff6c6b
hi SignifySignDeleteFirstLine guibg=#282c34 guifg=#ff6c6b

hi LspDiagnosticsDefaultError       guifg=#ff6655
hi LspDiagnosticsDefaultWarning     guifg=#ecbe7b
hi LspDiagnosticsDefaultHint        guifg=#4db5bd
hi LspDiagnosticsDefaultInformation guifg=#51afef
" }}}

" Custom colours {{{
hi Statusline guibg=#21242b guifg=#bbc2cf gui=NONE

" 1* Muted, 2* Italic, 3* Bold, 4* Muted Italic, 5* Muted Bold
hi User1 guibg=#21242b guifg=#73797e gui=NONE
hi User2 guibg=#21242b guifg=#bbc2cf gui=italic
hi User3 guibg=#21242b guifg=#bbc2cf gui=bold
hi User4 guibg=#21242b guifg=#73797e gui=italic
hi User5 guibg=#21242b guifg=#73797e gui=bold

hi UserGreen  guibg=#21242b guifg=#98be65 gui=bold
hi UserBlue   guibg=#21242b guifg=#51afef gui=bold
hi UserYellow guibg=#21242b guifg=#ecbe7b gui=bold
hi UserRed    guibg=#21242b guifg=#ff6c6b gui=bold
hi UserTeal   guibg=#21242b guifg=#4db5bd gui=bold
" }}}

" Highlight trailing whitespace {{{
hi TrailingWhitespace guifg=#73797e ctermfg=Grey
match TrailingWhitespace /\s\+$/
" }}}

" vim:foldmethod=marker
