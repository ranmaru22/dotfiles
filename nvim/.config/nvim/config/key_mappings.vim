" CUSTOM KEY-BINDINGS AND COMMANDS

" Git {{{
nmap <silent><Leader>gs  :G<CR>
nmap <silent><Leader>gv  :GV<CR>
nmap <silent><Leader>ggv :GV?<CR>
nmap <silent><Leader>gc  :GBranches<CR>

" Diff & merge conflict resolving
nmap <silent><Leader>ggd :Gvdiff<CR>
nmap <silent><Leader>gdh :diffget //2<CR>
nmap <silent><Leader>gdl :diffget //3<CR>

" vcs-jump bindings
nmap <silent><Leader>gqd :VcsJump diff<CR>
nmap <silent><Leader>gqm :VcsJump merge<CR>
nmap <Leader>gq/         :VcsJump diff 
nmap <silent><Leader>gn  :cnext<CR>
nmap <silent><Leader>gp  :cprevious<CR>
" }}}

" Buffers {{{
nmap <silent><Leader>bn       :bn<CR>
nmap <silent><Leader>bp       :bp<CR>
nmap <silent><Leader>bd       :bd<CR>
nmap <silent><Leader><Leader> :e#<CR>
" }}}

" Splits {{{
nmap <silent><Leader>sv :vsplit<CR>
nmap <silent><Leader>sh :split<CR>
nmap <silent><Leader>sc <C-w>q
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" }}}

" Consistent yanking {{{
nnoremap Y y$
vnoremap Y y$
" }}}

" Deleting without yanking {{{
noremap x  "_x
noremap X  "_D
" }}}

" Paste over visual selection without yanking {{{
vnoremap <Leader>p "_dP
" }}}

" Yanking & pasting from clipboard {{{
nnoremap \y "*y
vnoremap \y "*y
nnoremap \p "*p
vnoremap \p "*p
nnoremap \P "*P
vnoremap \P "*P
" }}}

" Clear highlighting {{{
nnoremap <silent><BS> :nohlsearch<CR>
" }}}

" Tab between results when searching {{{
set wildcharm=<C-z>
cnoremap <expr><Tab>   getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>"
cnoremap <expr><S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>"
" }}}

" Move current line up/down {{{
nnoremap <silent><M-j> :m +1<CR>==
nnoremap <silent><M-k> :m -2<CR>==
xnoremap <silent><M-j> :m '>+1<CR>gv=gv
xnoremap <silent><M-k> :m '<-2<CR>gv=gv
" }}}

" Enable/disable spell checking {{{
map <silent><Leader>ss :setlocal spell! spelllang=en_ca<CR>
" }}}

" Change all occurrences of a word {{{
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``dgN
" }}}

" Quick-select previously pasted text {{{
nnoremap <expr>qp '`[' . strpart(getregtype(), 0, 1) . '`]'
" }}}

" Better macros {{{
nnoremap Q @q
vnoremap Q :norm !q<CR>
" }}}

" Reload config {{{
nnoremap <Leader>ve :vsp $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
