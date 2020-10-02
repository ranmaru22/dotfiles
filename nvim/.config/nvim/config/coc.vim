 " COC SETTINGS

" Coc Extensions {{{
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-vetur',
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

" Coc Pairs {{{
autocmd filetype markdown let b:coc_pairs_disabled = ['`']
" }}}

" Coc Intellisense {{{
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr><Tab>
    \ (pumvisible() ? "\<C-n>" :
    \ <sid>check_back_space() ? "\<Tab>" : coc#refresh())
inoremap <expr><S-Tab> (pumvisible() ? "\<C-p>" : "\<C-h>")

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-space> coc#refresh()

if exists('*complete_info')
    inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" }}}

" Coc key mappings {{{
nmap <Leader>rr <plug>(coc-rename)
xmap <Leader>cf <plug>(coc-format-selected)
nmap <Leader>cf <plug>(coc-format-selected)
nmap <silent>gd <plug>(coc-definition)
nmap <silent>gy <plug>(coc-type-definition)
nmap <silent>gi <plug>(coc-implementations)
nmap <silent>gr <plug>(coc-references)
nmap <Leader>qf <plug>(coc-fix-current)

nmap <silent><C-n> <plug>(coc-diagnostic-next)
nmap <silent><C-m> <plug>(coc-diagnostic-prev)

nnoremap <silent>K                  :call <sid>show_documentation()<CR>
nnoremap <silent><Leader>grw        :CocSearch <C-r>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait><Leader>ca :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait><Leader>ce :<C-u>CocList extensions<CR>
nnoremap <silent><nowait><Leader>cc :<C-u>CocList commands<CR>
nnoremap <silent><nowait><Leader>co :<C-u>CocList outline<CR>
nnoremap <silent><nowait><Leader>cs :<C-u>CocList -i symbols<CR>
nnoremap <silent><nowait><Leader>cj :<C-u>CocNext<CR>
nnoremap <silent><nowait><Leader>ck :<C-u>CocPrev<CR>
nnoremap <silent><nowait><Leader>cp :<C-u>CocListResume<CR>

nnoremap <silent><nowait><Leader>cR :<C-u>CocRestart<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
