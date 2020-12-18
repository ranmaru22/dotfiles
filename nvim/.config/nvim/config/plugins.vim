" PLUGINS

" Install vim-plug if not found
if empty(glob('${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin()
    " LSP plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    " Treesitter & additional syntax plugins
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'cespare/vim-toml'
    Plug 'ron-rs/ron.vim'
    " File management
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Tmux integration 
    Plug 'christoomey/vim-tmux-navigator'
    " Utilities
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-repeat'
    Plug 'jpalardy/vim-slime'
    Plug 'justinmk/vim-sneak'
    Plug 'junegunn/vim-easy-align'
    Plug 'unblevable/quick-scope'
    Plug 'tmsvg/pear-tree'
    Plug 'mattn/emmet-vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " Git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'mhinz/vim-signify'
    Plug 'stsewd/fzf-checkout.vim'
    " Colour schemes & eye candy
    Plug 'arzg/vim-substrata'
    Plug 'ayu-theme/ayu-vim'
    Plug 'sainnhe/edge'
    Plug 'haze/anis.vim'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim:foldmethod=marker
