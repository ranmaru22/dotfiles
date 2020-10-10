" GENERAL SETTINGS

" Basic settings {{{
set encoding=UTF-8
set fileencoding=utf-8
set fileformat=unix

set title
set hidden
set confirm

set signcolumn=yes
set number relativenumber
set cursorline
set nowrap

set backspace=indent,eol,start
set showmode
set nojoinspaces

set conceallevel=2

let mapleader = "\<Space>"
" }}}

" Enable syntax {{{
filetype on
filetype plugin indent on
syntax on 
" Allow Lua + Python syntax inside vimscript
let g:vimsyn_embed = 'lP'
" }}}

" Set up undo {{{
set undodir=~/.config/nvim/.vimundo
set undofile
" }}}

" Ignore/smart case for searching {{{
set ignorecase
set smartcase
" }}}

" Indentation settings {{{
set autoindent
set smartindent
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4
" }}}

" Folding settings {{{
if has ('folding')
    set foldmethod=syntax
    set foldlevelstart=2
    set foldtext=utils#foldtext()
endif
" }}}

" Make splits open right/down by default {{{
set splitbelow
set splitright
" }}}

" Wildmenu settings {{{
set wildmode=longest,list,full
set wildmenu
" }}}

" Set scrolloff {{{
if !&scrolloff
    set scrolloff=2
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
" }}}

" Make lists behave {{{
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
" }}}

" Change default timeout to 100ms {{{
if !has('nvim') && &timeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
