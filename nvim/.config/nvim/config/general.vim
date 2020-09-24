" GENERAL SETTINGS

" Basic settings {{{
set encoding=UTF-8
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

let mapleader = "\<Space>"

set backspace=indent,eol,start
set smarttab
set noshowmode
set nojoinspaces

set autoindent
set smartindent
set expandtab
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

" Colours {{{
set background=dark
set termguicolors
colorscheme space_vim_theme
let g:space_vim_italic = 1
let g:space_vim_filetype_hi_groups = 1
let g:space_vim_plugin_hi_groups = 1
let g:space_vim_trans_bg = 1
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
" }}}

" vim:foldmethod=marker:foldlevel=0
