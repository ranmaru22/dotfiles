" PLUGIN-SPECIFIC SETTINGS

" Signify {{{
set updatetime=100
let g:signify_sign_show_count = 1
let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '-'

" Colour adjustments
" highlight SignifySignAdd    ctermfg=green  guifg=lightgreen cterm=NONE gui=NONE
" highlight SignifySignDelete ctermfg=red    guifg=lightred cterm=NONE gui=NONE
" highlight SignifySignChange ctermfg=yellow guifg=orange cterm=NONE gui=NONE

" Key mappings
nmap <Leader>gj <plug>(signify-next-hunk)
nmap <Leader>gk <plug>(signify-prev-hunk)
" }}}

" Highlighted Yank {{{
let g:highlightedyank_highlight_duration = 200
" }}}

" QuickScope {{{
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" Emmet {{{
let g:user_emmet_leader_key     = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascriptreact,typescriptreact,vue EmmetInstall
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
endif

autocmd! FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Key mappings
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <silent><C-f> :Files<CR>
nnoremap <silent><C-q> :Rg<CR>
nnoremap <silent><C-b> :Buffers<CR>
" }}}

" Colorizer.lua {{{
lua << EOF
require('colorizer').setup({
    'html';
    'vim';
    'yaml';
    css = { css = true; };
    scss = { css = true; };
})
EOF
" }}}

" vim:foldmethod=marker:foldlevel=0