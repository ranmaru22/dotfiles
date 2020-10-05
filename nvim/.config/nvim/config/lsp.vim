" LSP CONFIG

" Options {{{
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_enable_underline = 1
" }}}

" Key mappings {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent>K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><Leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><Leader>gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><Leader>gh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><Leader>gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent><Leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><Leader>g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><Leader>gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent><Leader>gp <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent><Leader>]  :NextDiagnosticCycle<CR>
nnoremap <silent><Leader>[  :PrevDiagnositcCycle<CR>
nnoremap <silent><Leader>od :OpenDiagnostic<CR>
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
:lua << END
    -- Status line plugin
    local lsp_status = require('lsp-status')
    lsp_status.config({
        status_symbol = 'LSP',
        indicator_errors = '✘',
        indicator_warnings = '',
        indicator_info = '',
        indicator_hint = '',
        indicator_ok = '✔'
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
    nvim_lsp.vuels.setup({on_attach=attach_client})
    nvim_lsp.rust_analyzer.setup({on_attach=attach_client})
    nvim_lsp.vimls.setup({on_attach=attach_client})
END

autocmd BufWritePost * lua vim.lsp.buf.formatting()
" }}}

" vim:foldmethod=marker:foldlevel=0
