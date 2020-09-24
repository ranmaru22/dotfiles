" PLUGIN-SPECIFIC SETTINGS

" Signify {{{
set updatetime=100

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
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

" Floaterm {{{
hi FloatermBorder guibg=none guifg=teal

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_autoclose = 1
let g:floaterm_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

nnoremap <silent><leader>f :FloatermNew --title=lf lf<CR>
" }}}

" Ctrlp / fzf {{{
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent><C-f> :Files<CR>
nnoremap <silent><C-q> :Rg<CR>
nnoremap <silent><C-b> :Buffers<CR>

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
let g:fzf_layout = { "window": { "width": 0.8, "height": 0.8 } }
" }}}

" pluginsvim:foldmethod=marker:foldlevel=0
