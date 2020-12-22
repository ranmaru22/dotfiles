" LSP CONFIG

" Options {{{
set complete-=i
set completeopt=menuone,noinsert
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_auto_change_source     = 1
let g:completion_enable_auto_popup      = 1
let g:completion_enable_auto_hover      = 1
let g:completion_enable_auto_signature  = 1
" }}}

" Key mappings {{{
" Cycle intellisense suggestions
inoremap <expr><Tab> pumvisible() ? "\<Return>" : "\<Tab>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Jump to definitions etc.
function! s:show_documentation()
    if index(['vim', 'help'], &ft) >= 0
        exe 'h '.expand('<cword>')
    else
        exe 'lua vim.lsp.buf.hover()'
    endif
endfunction

nnoremap <silent>K <cmd>call <SID>show_documentation()<CR>
" }}}
"
sign define LspDiagnosticsSignError text=✗ texthl=LspDiagnosticsSignError
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint

" Setting up language servers {{{
lua << EOF
-- Status line plugin
local lsp_status = require('lsp-status')
lsp_status.config({
    status_symbol = '%4*[LSP]%*',
    indicator_errors = '%#UserRed#✘%*',
    indicator_warnings = '%#UserYellow#%*',
    indicator_info = '%#UserBlue#%*',
    indicator_hint = '%#UserTeal#%*',
    indicator_ok = '%#UserGreen#OK%*'
})
lsp_status.register_progress()

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    update_in_insert = false,
  }
)

-- On attach ...
local attach_client = function(client)
    require('completion').on_attach(client)
    lsp_status.on_attach(client)
end

-- Loading servers
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({on_attach=attach_client})
lspconfig.cssls.setup({on_attach=attach_client})
lspconfig.jsonls.setup({on_attach=attach_client})
lspconfig.html.setup({on_attach=attach_client})
lspconfig.rust_analyzer.setup({on_attach=attach_client})
lspconfig.vimls.setup({on_attach=attach_client})
lspconfig.sumneko_lua.setup({on_attach=attach_client})
lspconfig.bashls.setup({on_attach=attach_client})
EOF

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" }}}

" vim:foldmethod=marker
