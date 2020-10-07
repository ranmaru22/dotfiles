" LSP CONFIG

" Options {{{
set complete-=i
set completeopt=menuone,noinsert,noselect
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_auto_change_source = 1

let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = '›'
let g:diagnostic_enable_underline = 1
" }}}

" Key mappings {{{
" Cycle intellisense suggestions
inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" Jump to definitions etc.
function! s:show_documentation()
    if (index(['vim','help'], &ft) >= 0)
        exe 'h '.expand('<cword>')
    else
        exe 'lua vim.lsp.buf.hover()'
    endif
endfunction

nnoremap <silent>K          <cmd>call <SID>show_documentation()<CR>
nnoremap <silent><Leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><Leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><Leader>gh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><Leader>gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent><Leader>gr <cmd>lua vim.lsp.buf.references()<CR>

" Symbol lists
nnoremap <silent><Leader>gD <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><Leader>gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Jump diagnostics
nnoremap <silent><Leader>]  :NextDiagnosticCycle<CR>
nnoremap <silent><Leader>[  :PrevDiagnositcCycle<CR>
nnoremap <silent><Leader>do :OpenDiagnostic<CR>

" Prettify
nnoremap <silent><nowait><Leader>pf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <Leader>pp =ip
" }}}

" Styling {{{
call sign_define("LspDiagnosticsErrorSign", {"text": "✘", "texthl" :"LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text": "", "texthl": "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text": "", "texthl": "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text": "", "texthl" :"LspDiagnosticsHint"})

hi link LspDiagnosticsError ErrorMsg
hi link LspDiagnosticsWarning WarningMsg
hi link LspDiagnosticsInformation ModeMsg
hi link LspDiagnosticsHint ModeMsg
" }}}

" Setting up language servers {{{
lua << EOF
-- Status line plugin
local lsp_status = require('lsp-status')
lsp_status.config({
    status_symbol = '',
    indicator_errors = '✘',
    indicator_warnings = '',
    indicator_info = '',
    indicator_hint = '',
    indicator_ok = '✓'
})
lsp_status.register_progress()

-- On attach ...
local attach_client = function(client)
    require('completion').on_attach(client)
    require('diagnostic').on_attach(client)
    lsp_status.on_attach(client)
end

-- Loading servers
local nvim_lsp = require('nvim_lsp')
nvim_lsp.tsserver.setup({on_attach=attach_client})
nvim_lsp.cssls.setup({on_attach=attach_client})
nvim_lsp.jsonls.setup({on_attach=attach_client})
nvim_lsp.html.setup({on_attach=attach_client})
nvim_lsp.vuels.setup({on_attach=attach_client})
nvim_lsp.rust_analyzer.setup({on_attach=attach_client})
nvim_lsp.vimls.setup({on_attach=attach_client})
nvim_lsp.bashls.setup({on_attach=attach_client})
nvim_lsp.pyls.setup({on_attach=attach_client})
nvim_lsp.texlab.setup({on_attach=attach_client})
EOF

autocmd BufWritePost * lua vim.lsp.buf.formatting()
" }}}

" vim:foldmethod=marker:foldlevel=0
