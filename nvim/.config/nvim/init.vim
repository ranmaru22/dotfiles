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
    Plug 'sheerun/vim-polyglot'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'arzg/vim-rust-syntax-ext'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'mattn/emmet-vim'
    " Utilities
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mcchrish/nnn.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-sleuth'
    Plug 'machakann/vim-highlightedyank'
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
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    " Colour schemes
    Plug 'sainnhe/edge'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'liuchengxu/space-vim-theme'
call plug#end()
" }}}

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/coc.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/keys.vim

" vim:foldmethod=marker:foldlevel=0
