" PLUGIN-SPECIFIC SETTINGS

" Signify {{{
set updatetime=100
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'
" }}}

" CoC Extensions {{{
let g:coc_global_extensions = [
    \ 'coc-explorer',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-sh',
    \ 'coc-ccls',
    \ 'coc-snippets'
    \ ]
" }}}

" Highlighted Yank {{{
let g:highlightedyank_highlight_duration = 200
" }}}

" CoC Intellisense {{{
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementations)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" }}}

" Explorer {{{
let g:coc_explorer_global_presets = {
    \ 'floating': {
        \ 'position': 'floating',
        \ 'open-action-strategy': 'sourceWindow'
        \ }
    \ }
map <C-n> :CocCommand explorer<CR>
nmap <Leader>f :CocCommand explorer --preset floating<CR>
" }}}

" CoC Key mappings {{{
nnoremap <silent><nowait> <Leader>ca  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <Leader>ce  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <Leader>cc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <Leader>co  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <Leader>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <Leader>cj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Leader>ck  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <Leader>cp  :<C-u>CocListResume<CR>

nmap <Leader>rr <Plug>(coc-rename)
nnoremap <Leader>grw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" }}}

" CoC Snippets / Ultisnips {{{
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
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
