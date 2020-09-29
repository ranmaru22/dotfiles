" USER COMMANDS

" Set spell check on certain filetypes
autocmd FileType tex,latex,markdown
   \ setlocal spell spelllang=en_ca

" Strip trailing whitespace on save
" Runs on all filetypes not in blacklist
let blacklist = ['vim', 'ruby', 'perl']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e
