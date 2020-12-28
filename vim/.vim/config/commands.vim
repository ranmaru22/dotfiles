" USER COMMANDS

" Quick insertions {{{
" Current time
command! Ict :put =strftime('%c')
iab <expr> __ct strftime('%c')
" My name (maintainer name)
iab __mn Alex Sun (ranmaru22)
" My email
iab __me alexsun82@icloud.com 
" Insert GitHub links
iab __gh https://github.com/ranmaru22/
iab __ghd https://github.com/ranmaru24/dotfiles
" }}}

" Auto-fit splits
autocmd VimResized * execute "normal! \<C-w>="

" Strip trailing whitespace on save
" Runs on all filetypes not in blacklist
let s:blacklist = ['vim', 'ruby', 'perl']
autocmd BufWritePre * if index(s:blacklist, &ft) < 0 | %s/\s\+$//e

" vim:foldmethod=marker
