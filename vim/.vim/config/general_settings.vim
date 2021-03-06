" GENERAL SETTINGS

" Basic settings {{{
set encoding=UTF-8
set fileencoding=utf-8
set fileformat=unix
set mouse=a

set title
set hidden
set confirm

set signcolumn=yes
set laststatus=2
set number relativenumber
set cursorline
set nowrap

set backspace=indent,eol,start
set showmode
set nojoinspaces

set conceallevel=2

set list
set listchars=tab:→\ ,trail:·

let mapleader = "\<Space>"
" }}}

" Diffrent cursor for insert mode {{{
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" }}}

" Syntax {{{
filetype on
filetype plugin indent on
syntax on
" }}}

" Allow Lua + Python syntax inside vimscript
" let g:vimsyn_embed = 'lP'
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

" vim:foldmethod=marker
