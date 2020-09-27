" PLUGIN-SPECIFIC SETTINGS

" Signify {{{
set updatetime=100
let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '-'
" }}}

" Sneak {{{
let g:sneak#label = 1
" }}}

" Highlighted Yank {{{
let g:highlightedyank_highlight_duration = 200
" }}}

" Emmet {{{
let g:user_emmet_leader_key     = ','
let g:user_emmet_install_global = 0

autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
" }}}

" fzf {{{
let $FZF_DEFAULT_OPTS    = "--layout=reverse --info=inline"
let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
let g:fzf_layout         = { "down": "~40%" }

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

    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
