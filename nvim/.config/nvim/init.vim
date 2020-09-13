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
    " Syntax plugins
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'sheerun/vim-polyglot'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'arzg/vim-rust-syntax-ext'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'mattn/emmet-vim'
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Utilities
    Plug 'justinmk/vim-sneak'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-sleuth'
    Plug 'machakann/vim-highlightedyank'
    " File manager
    Plug 'ptzz/lf.vim'
    Plug 'rbgrouleff/bclose.vim'
    " Git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'mhinz/vim-signify'
    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    " Eye candy plugins
    Plug 'ap/vim-buftabline'
    Plug 'glepnir/spaceline.vim'
    Plug 'ryanoasis/vim-devicons'
    " Colour schemes
    Plug 'liuchengxu/space-vim-dark'
    Plug 'liuchengxu/space-vim-theme'
call plug#end()
" }}}

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/coc.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/keys.vim

" vim:foldmethod=marker:foldlevel=0
