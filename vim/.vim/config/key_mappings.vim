" CUSTOM KEY-BINDINGS AND COMMANDS

" Emacs-style bindings for Insert mode {{{
imap <C-f>  <Right>
imap <M-f>  <C-o>w
imap <C-b>  <Left>
imap <M-b>  <C-o>b
imap <C-a>  <Home>
imap <C-e>  <End>
imap <M-BS> <C-w>
" }}}

" Searching {{{
nnoremap <silent><C-s> :BLines<CR>
" }}}

" Git {{{
nmap <silent><Leader>gg :G<CR>
nmap <silent><Leader>gc :Commits<CR>
nmap <silent><Leader>gd :Gvdiffsplit!<CR>

" Hunk navigation (needs Signify)
nmap <Leader>gj <plug>(signify-next-hunk)
nmap <Leader>gk <plug>(signify-prev-hunk)
" }}}

" Files {{{
" Vim configuration
nnoremap <Leader>ce :vsp $MYVIMRC<CR>
nnoremap <Leader>cl :source $MYVIMRC <bar> :doautocmd BufRead<CR>

" Information
nmap <Leader>fih :echo "hi: " . synIDattr(synID(line("."),col("."),1),"name") . ", trans: "
    \ . synIDattr(synID(line("."),col("."),0),"name") . ", lo:"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

nmap <silent><C-p>      :GFiles<CR>
nmap <silent><C-y>      :GFiles?<CR>
nmap <silent><C-e>      :Files<CR>
nmap <silent><C-q>      :Rg<CR>
" }}}

" Buffers - Prefix b {{{
nmap <silent><Leader>bb :Buffers<CR>
nmap <silent><Leader>bs :BLines<CR>
nmap <silent><Leader>bn :bn<CR>
nmap <silent><Leader>bp :bp<CR>
nmap <silent><Leader>bd :bd<CR>

" Quick navigation
nmap <silent><Leader>,        :Buffers<CR>
nmap <silent><Leader><Leader> :e#<CR>
" }}}

" Windows - Prefix w {{{
nmap <silent><Leader>wv :vsplit<CR>
nmap <silent><Leader>ws :split<CR>
nmap <silent><Leader>wc <C-w>q
nmap <silent><Leader>wt :Vexplore!<CR>

" Quick navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" }}}

" Tabs - Prefix t {{{
nmap <silent><Leader>tt :tabnew<CR>
nmap <silent><Leader>tc :tabclose<CR>
nmap <silent><Leader>tn :tabnext<CR>
nmap <silent><Leader>tp :tabprevious<CR>

" Quick navigation
nmap <silent><M-h> :tabprevious<CR>
nmap <silent><M-l> :tabnext<CR>
" }}}

" Settings - prefix s {{{
" Enable/disable spell checking
nmap <silent><Leader>ss :setlocal spell! spelllang=en_ca<CR>
" }}}

" Easy align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
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

" vim:foldmethod=marker
