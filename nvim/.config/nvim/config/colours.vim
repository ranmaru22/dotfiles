" COLOUR SETTINGS

set background=dark

augroup onColourChange
    autocmd!
    autocmd ColorScheme * call b16config#customize()
augroup END

colorscheme base16-tomorrow-night
