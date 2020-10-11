" USER COMMANDS

" Quick insertions {{{
" Current time
command! Ict :put =strftime('%c')
iab <expr> __ct strftime('%c')
" My name (maintainer name)
iab __mn Alex Sun (ranmaru22)
" Insert GitHub links
iab __gh https://github.com/ranmaru22/
iab __ghd https://github.com/ranmaru22/dotfiles
" }}}

" Highlight trailing whitespace {{{
match TrailingWhitespace /\s\+$/
" }}}

" Strip trailing whitespace on save {{{
" Runs on all filetypes not in blacklist
let blacklist = ['vim', 'ruby', 'perl']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e
" }}}

" vim:foldmethod=marker:foldlevel=0
