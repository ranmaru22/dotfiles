" COLOUR SETTINGS

set t_Co=256

if has("termguicolors")
    set termguicolors
endif

set background=dark
colorscheme doom-one

" My colours -- needed for the setColours function
let g:sl_muted  = { 'gui': '#7f8c98', 'cterm': '244' }
let g:sl_green  = { 'gui': '#98be65', 'cterm': '010' }
let g:sl_red    = { 'gui': '#ff6c6b', 'cterm': '009' }
let g:sl_yellow = { 'gui': '#ecbe7b', 'cterm': '011' }
let g:sl_blue   = { 'gui': '#51afef', 'cterm': '012' }
let g:sl_teal   = { 'gui': '#46d9ff', 'cterm': '014' }

" Set Signify colours in case they're not defined
hi default SignifySignAdd    guifg=#98be65 ctermfg=010
hi default SignifySignChange guifg=#51afef ctermfg=012
hi default SignifySignDelete guifg=#ff6c6b ctermfg=009

" Overwrite some stuff
hi StatusLine   guibg=#1c1f24
hi StatusLineNC guibg=#23272e
hi CursorLine   guibg=#202328
hi CursorLineNr guibg=#202328

augroup onChangeColourScheme
    autocmd ColorScheme * call utils#setColours()
    autocmd ColorScheme * match TrailingWhitespace /\s\+$/
augroup END

call utils#setColours()
match TrailingWhitespace /\s\+$/

" vim:foldmethod=marker
