" COC SETTINGS

" CoC Extensions {{{
let g:coc_global_extensions = [
    \ 'coc-git',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-rust-analyzer',
    \ 'coc-sh',
    \ 'coc-ccls',
    \ 'coc-vimlsp',
    \ ]
" }}}

" CoC Pairs {{{
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
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

inoremap <silent><expr> <c-k> coc#refresh()

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rr <Plug>(coc-rename)
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementations)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent><C-n> <Plug>(coc-diagnostic-next)
nmap <silent><C-m> <Plug>(coc-diagnostic-prev)

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>grw :CocSearch <C-R>=expand("<cword>")<CR><CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" }}}

" CoC Key mappings {{{
nnoremap <silent><nowait> <Leader>ca :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <Leader>ce :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <Leader>cc :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <Leader>co :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <Leader>cs :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <Leader>cj :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Leader>ck :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <Leader>cp :<C-u>CocListResume<CR>
" }}}

" CoC Snippets {{{
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
" }}}

" vim:foldmethod=marker:foldlevel=0
