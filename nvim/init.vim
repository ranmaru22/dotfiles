"     _       _ __        _         
"    (_)___  (_) /__   __(_)___ ___ 
"   / / __ \/ / __/ | / / / __ `__ \
"  / / / / / / /__| |/ / / / / / / /
" /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/ 
"                            
"  File:        init.vim
"  Maintainer:  Alex Sun (ranmaru22)
"  GitHub:      https://github.com/ranmaru22/dotfiles
"
"
" Plugins {{{
call plug#begin()
    Plug 'sheerun/vim-polyglot'
    Plug 'davidhalter/jedi-vim'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    if has('nvim') || has('patch-8.0.902')
      Plug 'mhinz/vim-signify'
    else
      Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
    endif
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'ayu-theme/ayu-vim-airline'
    Plug 'Yggdroot/indentLine'
    " Color schemes
    Plug 'connorholyday/vim-snazzy'
    Plug 'ayu-theme/ayu-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end() 
" }}}

" Basic settings {{{
set fileencoding=utf-8
set fileformat=unix
filetype on
filetype plugin indent on
syntax on
set title
set hidden
set confirm
set modeline
set modelines=5

set backspace=indent,eol,start
set smarttab
set noshowmode

set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set foldlevel=10
set complete-=i

set number relativenumber
set cursorline
set nowrap

set wildmode=longest,list,full
set wildmenu
set ruler

if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if !has('nvim') && &timeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif
" }}}

" Syntax Settings {{{
let g:asmsyntax = 'nasm'
" }}}

" Colors {{{
set background=dark
set termguicolors
let ayucolor="dark"
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
" }}}

" Signify {{{
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" }}}

" Sneak {{{
let g:sneak#label = 1
let g:sneak#s_next = 1
"}}}

" CoC Extensions {{{
let g:coc_global_extensions = [
    \ 'coc-explorer',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-ccls',
    \ 'coc-snippets'
    \ ]
" }}}

" Indent Line {{{
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_char_list = ['│', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" }}}

" CoC Intellisense {{{
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementations)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" }}}

" CoC Explorer {{{
map <C-n> :CocCommand explorer<CR>
nnoremap <silent><nowait> <space>f  :<C-u>CocCommand explorer --preset floating<CR>
" }}}

" CoC Key mappings {{{
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

" CoC Snippets / Ultisnips {{{
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}

" Emmet {{{
let g:user_emmet_leader_key = ','
" }}}

" Signify {{{
set updatetime=100
" }}}

" Ctrlp / fzf {{{
nnoremap <C-p> :GFiles<CR>
nnoremap <C-q> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" }}}

" Custom key mappings {{{
nmap <leader>gs :G<CR>
nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" Custom Commands {{{
command! Bufferclose bp | sp | bn | bd
cabbrev bc Bufferclose
cmap w!! !sudo tee %
" }}}

" vim:foldmethod=marker:foldlevel=0
