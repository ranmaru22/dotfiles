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

" Special syntax settings {{{
let g:asmsyntax = 'nasm'                    " set nasm as default assembler syntax

let g:haskell_enable_quantification = 1     " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1        " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1        " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1          " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1    " to enable highlighting of `static`
let g:haskell_indent_guard = 4

let g:vim_markdown_conceal = 2              " to avoid folding of links
let g:vim_markdown_conceal_code_blocks = 0  " to avoid folding of code blocks
let g:vim_markdown_math = 1                 " formatting options
let g:vim_markdown_toml_frontmatter = 1     " |
let g:vim_markdown_frontmatter = 1          " |
let g:vim_markdown_strikethrough = 1        " |
let g:vim_markdown_autowrite = 1            " |
let g:vim_markdown_edit_url_in = 'tab'      " |
let g:vim_markdown_follow_anchor = 1        " |
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
