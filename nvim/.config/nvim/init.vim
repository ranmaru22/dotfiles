" =============================================================================
" File:        init.vim
" Maintainer:  Alex Sun (ranmaru22)
" GitHub:      https://github.com/ranmaru22/dotfiles
" =============================================================================

" Plugins {{{
call plug#begin()
    " LSP plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/diagnostic-nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    " Syntax plugins
    let g:polyglot_disabled = ['autoindent']
    Plug 'sheerun/vim-polyglot'
    Plug 'arzg/vim-rust-syntax-ext'
    Plug 'mattn/emmet-vim'
    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Utilities
    Plug 'airblade/vim-rooter'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-repeat'
    Plug 'machakann/vim-highlightedyank'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'mhinz/vim-signify'
    " Colour schemes
    Plug 'arzg/vim-substrata'
call plug#end()
" }}}

source $HOME/.config/nvim/config/general.vim
source $HOME/.config/nvim/config/syntax_settings.vim
source $HOME/.config/nvim/config/lsp.vim
source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/commands.vim

" vim:foldmethod=marker:foldlevel=0
