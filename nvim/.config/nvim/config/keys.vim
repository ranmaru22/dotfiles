" CUSTOM KEY-BINDINGS AND COMMANDS

" Custom key mappings {{{
" Git
nmap <silent><leader>gs  :G<CR>
nmap <silent><leader>gv  :GV<CR>
nmap <silent><leader>gc  :GCheckout<CR>
nmap <silent><leader>ggd :Gdiff<CR>

" Buffers
nmap <silent><leader>bn :bn<CR>
nmap <silent><leader>bp :bp<CR>
nmap <silent><leader>bd :bd<CR>
nmap <silent><leader>bc :bc<CR>

" Consistent yanking
nnoremap Y y$
vnoremap Y y$

" Deleting without yanking
noremap x  "_x
noremap X  "_D

" Yanking & pasting from clipboard
nnoremap sy "*y
vnoremap sy "*y
nnoremap sp "*p
vnoremap sp "*p
nnoremap sP "*P
vnoremap sP "*P

" Clear highlighting
nnoremap <silent><BS> :nohlsearch<CR>

" Prettify
noremap <leader>pp =ip

" Change all occurences of a word
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgN
nnoremap d# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgN

" Quick-select previously pasted text
nnoremap <expr> qp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Macros
nnoremap Q @q
vnoremap Q :norm !q<CR>

" Config
nnoremap <leader>ve :vsp $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" Custom Commands {{{
command! Bufferclose bp | sp | bn | bd
cabbrev bc Bufferclose
cmap w!! !sudo tee %
" }}}

" vim:foldmethod=marker:foldlevel=0
