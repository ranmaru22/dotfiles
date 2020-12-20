" COLOUR SETTINGS

set t_Co=256

if has("termguicolors")
    set termguicolors
endif

set background=dark

let g:edge_sign_column_background = 'none'
let g:edge_current_word = 'bold'

colorscheme xcodedark

" My colours -- needed for the setColours function {{{
let g:sl_muted  = { 'gui': '#7f8c98', 'cterm': '244' }
let g:sl_green  = { 'gui': '#acf2e4', 'cterm': '010' }
let g:sl_red    = { 'gui': '#ff8a7a', 'cterm': '009' }
let g:sl_yellow = { 'gui': '#d9c97c', 'cterm': '011' }
let g:sl_blue   = { 'gui': '#6bdfff', 'cterm': '012' }
let g:sl_teal   = { 'gui': '#b281eb', 'cterm': '014' }
" }}}

augroup onChangeColourScheme
    autocmd ColorScheme * call utils#setColours()
    autocmd ColorScheme * match TrailingWhitespace /\s\+$/
augroup END

call utils#setColours()
match TrailingWhitespace /\s\+$/

" vim:foldmethod=marker
