"
" ██╗███╗   ██╗██╗████████╗   ██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝   ██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║      ██║   ██║██║██╔████╔██║
" ██║██║╚██╗██║██║   ██║      ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║   ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"                            
" File:        init.vim
" Maintainer:  Alex Sun (ranmaru22)
" GitHub:      https://github.com/ranmaru22/dotfiles
"
"
" Plugins {{{
call plug#begin()
    Plug 'sheerun/vim-polyglot'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'arzg/vim-rust-syntax-ext'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'vim-airline/vim-airline'
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'airblade/vim-rooter'
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
    Plug 'Yggdroot/indentLine'
    Plug 'machakann/vim-highlightedyank'
    " Color schemes
    Plug 'arzg/vim-colors-xcode'
    Plug 'ayu-theme/ayu-vim'
    Plug 'sainnhe/edge'
    Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end() 
" }}}

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/keys.vim

" vim:foldmethod=marker:foldlevel=0
