" GENERAL SETTINGS

" Basic settings {{{
set encoding=UTF-8
set fileencoding=utf-8
set fileformat=unix
set mouse=a

filetype on
filetype plugin indent on
let g:asmsyntax = 'nasm'    " set nasm as default assembler syntax
syntax on

set title
set hidden
set confirm
set modeline
set modelines=5

let mapleader = "\<Space>"

set backspace=indent,eol,start
set smarttab
set noshowmode
set nojoinspaces

set undodir=~/.config/nvim/.vimundo
set undofile

set autoindent
set smartindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set foldlevel=10
set complete-=i

set splitbelow
set splitright

set number relativenumber
set cursorline
set nowrap

set wildmode=longest,list,full
set wildmenu
set ruler

set conceallevel=2

if !&scrolloff
    set scrolloff=2
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

" Colours {{{
set background=dark
set termguicolors
colorscheme substrata
" }}}

" vim:foldmethod=marker:foldlevel=0
