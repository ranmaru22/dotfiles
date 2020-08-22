" CUSTOM KEY-BINDINGS AND COMMANDS

" Custom key mappings {{{
nmap <leader>gs :G<CR>
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" Custom Commands {{{
command! Bufferclose bp | sp | bn | bd
cabbrev bc Bufferclose
cmap w!! !sudo tee %
" }}}

" vim:foldmethod=marker:foldlevel=0
