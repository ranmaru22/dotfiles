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
let g:airline_powerline_fonts = 1
let g:airline_theme = "violet"
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#branch#vcs_checks = []
let g:airline_section_y = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

" Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.spell = ''

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}

" Emmet {{{
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
" }}}

" nnn {{{
let g:nnn#set_default_mappings = 0
nnoremap <leader>f :NnnPicker '%:p:h'<CR>
let g:nnn#command = 'nnn -d'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }
" }}}

" vsnip {{{
let g:vsnip_snippet_dir = $HOME . '/.config/nvim/snippets'
imap <expr><C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr><C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
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
