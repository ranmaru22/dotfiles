" PLUGIN-SPECIFIC SETTINGS

" Netrw {{{
let g:netrw_liststyle    = 3
let g:netrw_banner       = 0
let g:netrw_browse_split = 4
let g:netrw_altv         = 1
let g:netrw_winsize      = 25
" }}}

" Signify {{{
set updatetime=100

let g:signify_sign_show_count = 1
let g:signify_sign_add        = '│'
let g:signify_sign_change     = '│'
let g:signify_sign_delete     = '-'
" }}}

" QuickScope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" Emmet {{{
let g:user_emmet_leader_key     = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascriptreact,typescriptreact,vue EmmetInstall
" }}}

" Hexokinase {{{
let g:Hexokinase_highlighters  = ['virtual']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

autocmd BufWritePost,BufReadPost * HexokinaseTurnOn
" }}}

" Slime {{{
let g:slime_target         = "tmux"
let g:slime_paste_file     = "$HOME/.config/nvim/tmp/slime_paste"
let g:slime_default_config = { "socket_name": "default", "target_pane": "{last}" }
" }}}

" Pear Tree {{{
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers     = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_backspace   = 1
" }}}

" fzf {{{
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
" }}}

" vim:foldmethod=marker
