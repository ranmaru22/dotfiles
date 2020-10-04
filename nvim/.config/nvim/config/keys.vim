" CUSTOM KEY-BINDINGS AND COMMANDS

" Custom key mappings {{{
" Git
nmap <silent><Leader>gs  :G<CR>
nmap <silent><Leader>gv  :GV<CR>
nmap <silent><Leader>gc  :GBranches<CR>
nmap <silent><Leader>ggd :Gdiff<CR>

" Buffers
nmap <silent><Leader>bn       :bn<CR>
nmap <silent><Leader>bp       :bp<CR>
nmap <silent><Leader>bd       :bd<CR>
nmap <silent><Leader><Leader> :e#<CR>

" Splits
nmap <silent><Leader>sv :vsplit<CR>
nmap <silent><Leader>sh :split<CR>
nmap <silent><Leader>sc <C-w>q
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
nnoremap \y "*y
vnoremap \y "*y
nnoremap \p "*p
vnoremap \p "*p
nnoremap \P "*P
vnoremap \P "*P

" Clear highlighting
nnoremap <silent><BS> :nohlsearch<CR>

" Prettify indentation
noremap <Leader>pp =ip

" Move current line up/down
nnoremap <silent><A-j> :m +1<CR>==
nnoremap <silent><A-k> :m -2<CR>==
xnoremap <silent><A-j> :m '>+1<CR>gv=gv
xnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Enable/disable spell checking
map <silent><Leader>ss :setlocal spell! spelllang=en_ca<CR>

" Change all occurrences of a word
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgN

" Quick-select previously pasted text
nnoremap <expr>qp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Better macros
nnoremap Q @q
vnoremap Q :norm !q<CR>

" Reload config
nnoremap <Leader>ve :vsp $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" Plugin-specific mappings {{{
" Coc
nnoremap <silent><nowait><Leader>pf :<C-u>CocCommand prettier.formatFile<CR>

" Signify
nmap <Leader>gj <plug>(signify-next-hunk)
nmap <Leader>gk <plug>(signify-prev-hunk)

" fzf
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent><C-f> :Files<CR>
nnoremap <silent><C-q> :Rg<CR>
nnoremap <silent><C-b> :Buffers<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
