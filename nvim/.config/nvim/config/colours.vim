" COLOUR SETTINGS

set t_Co=256

if exists("+termguicolors")
    set termguicolors
endif

set background=dark

let g:edge_sign_column_background = 'none'
let g:edge_current_word = 'bold'

colorscheme edge

" My colours -- needed for the setColours function {{{
let g:sl_muted  = { 'gui': '#88909f', 'cterm': '244' }
let g:sl_green  = { 'gui': '#a0c980', 'cterm': '010' }
let g:sl_red    = { 'gui': '#ec7279', 'cterm': '009' }
let g:sl_yellow = { 'gui': '#deb974', 'cterm': '011' }
let g:sl_blue   = { 'gui': '#6cb6eb', 'cterm': '012' }
let g:sl_teal   = { 'gui': '#5dbbc1', 'cterm': '014' }
" }}}

augroup onChangeColourScheme
    autocmd ColorScheme * call utils#setColours()
    autocmd ColorScheme * match TrailingWhitespace /\s\+$/
augroup END

call utils#setColours()
match TrailingWhitespace /\s\+$/

" vim:foldmethod=marker
