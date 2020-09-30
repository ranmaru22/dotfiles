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

" Adjustments
hi SignifySignAdd    ctermfg=green  guifg=#92c47e cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=red    guifg=#fe9f7c cterm=NONE gui=NONE
hi SignifySignChange ctermfg=blue   guifg=#a0b9d8 cterm=NONE gui=NONE
hi SpellBad   ctermfg=red   guifg=#cf8164 guibg=NONE guisp=#cf8164 gui=undercurl cterm=undercurl
hi SpellCap   ctermfg=blue  guifg=#a0b9d8 guibg=NONE guisp=#cf8164 gui=undercurl cterm=undercurl
hi SpellLocal ctermfg=green guifg=#92c47e guibg=NONE guisp=#cf8164 gui=undercurl cterm=undercurl
hi SpellRare  ctermfg=blue  guifg=#8296b0 guibg=NONE guisp=#cf8164 gui=undercurl cterm=undercurl
" }}}

" vim:foldmethod=marker:foldlevel=0
