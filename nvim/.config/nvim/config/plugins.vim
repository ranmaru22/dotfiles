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
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0

autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
" }}}

" fzf {{{
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline"
let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
" let g:fzf_layout = { "window": { "width": 0.8, "height": 0.8 } }
let g:fzf_layout = { "down": "~40%" }
" }}}

" vim:foldmethod=marker:foldlevel=0
