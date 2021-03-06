" PLUGINS

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif

if !empty(glob('~/.vim/autoload/plug.vim'))
    call plug#begin()
    " File management
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Syntax
    Plug 'sheerun/vim-polyglot'
    " Utilities
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'junegunn/vim-easy-align'
    Plug 'unblevable/quick-scope'
    Plug 'mattn/emmet-vim'
    " Git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    " Colour schemes & eye candy
    Plug 'romgrk/doom-one.vim'
    call plug#end()
endif

" Netrw {{{
let g:netrw_liststyle    = 3
let g:netrw_banner       = 0
let g:netrw_browse_split = 3
let g:netrw_altv         = 1
let g:netrw_winsize      = 25
" }}}

" Signify {{{
if utils#hasPlugin("vim-signify")
    set updatetime=100

    let g:signify_sign_show_count        = 1
    let g:signify_sign_add               = '▌'
    let g:signify_sign_change            = '▌'
    let g:signify_sign_delete            = '▁'
    let g:signify_sign_delete_first_line = '▔'
endif
" }}}

" QuickScope {{{
if utils#hasPlugin("quick-scope")
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
endif
" }}}

" Emmet {{{
if utils#hasPlugin("emmet-vim")
    let g:user_emmet_leader_key     = ','
    let g:user_emmet_install_global = 0

    autocmd FileType html,css,scss,javascriptreact,typescriptreact,vue EmmetInstall
endif
" }}}

" fzf {{{
if utils#hasPlugin("fzf.vim")
    let $FZF_DEFAULT_OPTS    = "--layout=reverse --info=inline --multi"
    let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
    let g:fzf_buffers_jump   = 1
    let g:fzf_layout         = { "down": "~35%" }
    let g:fzf_preview_window = ['right:50%', 'ctrl-L']

    if has('nvim') && !exists('g:fzf_colors')
        let g:fzf_colors = {
                    \ 'fg':      ['fg', 'Normal'],
                    \ 'bg':      ['bg', 'Normal'],
                    \ 'hl':      ['fg', 'Comment'],
                    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
                    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
                    \ 'hl+':     ['fg', 'Statement'],
                    \ 'info':    ['fg', 'PreProc'],
                    \ 'border':  ['fg', 'Ignore'],
                    \ 'prompt':  ['fg', 'Conditional'],
                    \ 'pointer': ['fg', 'Exception'],
                    \ 'marker':  ['fg', 'Keyword'],
                    \ 'spinner': ['fg', 'Label'],
                    \ 'header':  ['fg', 'Comment']
                    \ }
    endif

    autocmd! FileType fzf set laststatus=0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
" }}}

" vim:foldmethod=marker
