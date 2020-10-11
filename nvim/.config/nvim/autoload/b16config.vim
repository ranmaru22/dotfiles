" CUSTOMIZE BASE16 COLOURSCHEME

function! b16config#customize() abort
    call Base16hi("Comment",
        \ g:base16_gui03, "", g:base16_cterm03, "", "italic", "italic")

    " LSP Diagnostics
    call Base16hi("LspDiagnosticsError",
        \ g:base16_gui08, "", g:base16_cterm08, "", "italic", "italic")
    call Base16hi("LspDiagnosticsErrorSign",
        \ g:base16_gui09, "", g:base16_cterm09, "", "italic", "italic")

    " Quick Scope highlighting
    call Base16hi("QuickScopePrimary",
        \ g:base16_gui0B, "", g:base16_cterm0B, "", "bold,underline", "bold,underline")
    call Base16hi("QuickScopeSecondary",
        \ g:base16_gui0C, "", g:base16_cterm0C, "", "bold,underline", "bold,underline")

    " Update Statusline
    call Base16hi("Statusline",
        \ g:base16_gui04, g:base16_gui01, g:base16_cterm04, g:base16_cterm01, "", "")
    call statusline#highlight()
endfunction
