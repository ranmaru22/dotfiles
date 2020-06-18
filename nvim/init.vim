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
    " Plug 'dense-analysis/ale'
    Plug 'scrooloose/nerdtree/', { 'on': 'NERDTreeToggle' }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    " Color schemes
    Plug 'joshdick/onedark.vim'
    Plug 'connorholyday/vim-snazzy'
call plug#end() 
" }}}

" Basic settings {{{
set fileencoding=utf-8
set fileformat=unix
filetype on
filetype plugin on
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

if !has('nvim') && &timeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif
" }}}

" Colors {{{
set background=dark
colorscheme snazzy
let g:airline_powerline_fonts = 1
hi Normal guibg=NONE ctermbg=NONE
" }}}

" Nerdtree {{{
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='t'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" }}}

" CoC Extensions {{{
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-sh'
    \ ]
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

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementations)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1 
" }}}

" Emmet {{{
let g:user_emmet_leader_key = ','
" }}}

" Ctrlp {{{
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

" Custom key mappings {{{
nmap <leader>gs :G<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" Custom Commands {{{
command Bufferclose bp | sp | bn | bd
cabbrev bc Bufferclose
" }}}

" vim:foldmethod=marker:foldlevel=0
