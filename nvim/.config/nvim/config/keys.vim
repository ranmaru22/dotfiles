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

" Splits
nmap <silent><leader>sv :vsplit<CR>
nmap <silent><leader>sh :split<CR>
nmap <silent><leader>sc <C-w>q
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Consistent yanking
nnoremap Y y$
vnoremap Y y$

" Deleting without yanking
noremap x  "_x
noremap X  "_D

" Yanking & pasting from clipboard
nnoremap 'y "*y
vnoremap 'y "*y
nnoremap 'p "*p
vnoremap 'p "*p
nnoremap 'P "*P
vnoremap 'P "*P

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
