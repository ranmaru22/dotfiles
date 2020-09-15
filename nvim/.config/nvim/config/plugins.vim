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

" Buftabline {{{
hi! link BufTabLineCurrent FileName
hi! link BufTabLineActive  GitInfo
hi! link BufTabLineHidden  LineFormatRight
hi! link BufTabLineFill    CocBar
let g:buftabline_separators = "on"
" }}}

" Spaceline {{{
hi! HomeMode gui=bold
let g:spaceline_seperate_style= 'slant-fade'
let g:spaceline_colorscheme = 'space'
let g:spaceline_git_branch_icon = ' '
let g:spaceline_funcicon = ' '
let g:spaceline_diagnostic_warnsign = ' '
let g:spaceline_diagnostic_errorsign = '✘'
let g:spaceline_custom_vim_status = {
    \ "n":"NORMAL",
    \ "V":"V-LINE", "v":"VISUAL", "\<C-v>":"V-BLOCK",
    \ "i":"INSERT", "R":"REPLACE",
    \ "s":"SELECT", "t":"TERM", "c":"COMMAND", "!":"SE"
    \ }
let g:spaceline_custom_diff_icon = [' ', ' ', ' ']
" }}}

" Easymotion {{{
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
" }}}

" Emmet {{{
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
" }}}

" vsnip {{{
let g:vsnip_snippet_dir = $HOME . '/.config/nvim/snippets'
imap <expr><C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr><C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
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

" vim:foldmethod=marker:foldlevel=0
