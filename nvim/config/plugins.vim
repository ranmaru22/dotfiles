" PLUGIN-SPECIFIC SETTINGS

" Signify {{{
set updatetime=100
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
" }}}

" Highlighted Yank {{{
let g:highlightedyank_highlight_duration = 200
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = "\ue0b8"
let g:airline#extensions#tabline#right_sep = "\ue0be"
let g:airline#extensions#tabline#left_alt_sep = "\ue0bb"
let g:airline#extensions#tabline#right_alt_sep = "\ue0bb"
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_left_sep = "\ue0b8"
let g:airline_right_sep = "\ue0be"
let g:airline_left_alt_sep = "\ue0bb"
let g:airline_right_alt_sep = "\ue0bb"
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:airline_skip_empty_sections = 1
" }}}

" Emmet {{{
let g:user_emmet_leader_key = ','
" }}}

" Ctrlp / fzf {{{
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-q> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
" }}}

" vim:foldmethod=marker:foldlevel=0
