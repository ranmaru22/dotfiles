" CUSTOMIZE BASE16 COLOURSCHEME

function! b16config#customize() abort
    " Some asthetic adjustments
    call Base16hi("htmlBold",
        \ g:base16_gui05, "", g:base16_cterm05, "", "bold", "")
    call Base16hi("htmlItalic",
        \ g:base16_gui04, "", g:base16_cterm04, "", "italic", "")
    call Base16hi("matchParen",
        \ g:base16_gui06, "", g:base16_cterm06, "", "bold", "")

    " Colour spelling highlights
    call Base16hi("SpellBad",
        \ g:base16_gui08, "", g:base16_cterm08, "")
    call Base16hi("SpellLocal",
        \ g:base16_gui09, "", g:base16_cterm09, "")
    call Base16hi("SpellCap",
        \ g:base16_gui0D, "", g:base16_cterm0D, "")
    call Base16hi("SpellRare",
        \ g:base16_gui0E, "", g:base16_cterm0E, "")

    " Trailing whitespace
    call Base16hi("TrailingWhitespace",
        \ g:base16_gui03, "", g:base16_cterm03, "", "undercurl", "")

    " Quick Scope highlighting
    call Base16hi("QuickScopePrimary",
        \ g:base16_gui0B, "", g:base16_cterm0B, "", "bold,underline", "")
    call Base16hi("QuickScopeSecondary",
        \ g:base16_gui0C, "", g:base16_cterm0C, "", "bold,underline", "")

    " Statusline
    call Base16hi("Statusline",
        \ g:base16_gui04, g:base16_gui01, g:base16_cterm04, g:base16_cterm01)
    " 1* Muted, 2* Inverse, 3* Bold, 4* Muted Italic, 5* Inverse Bold
    call Base16hi("User1",
        \ g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01)
    call Base16hi("User2",
        \ g:base16_gui01, g:base16_gui04, g:base16_cterm01, g:base16_cterm04)
    call Base16hi("User3",
        \ g:base16_gui04, g:base16_gui01, g:base16_cterm04, g:base16_cterm01, "bold", "")
    call Base16hi("User4",
        \ g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "italic", "")
    call Base16hi("User5",
        \ g:base16_gui01, g:base16_gui04, g:base16_cterm01, g:base16_cterm04, "bold", "")
    " Colours for the lhs indicator
    call Base16hi("SLSaved",
        \ g:base16_gui01, g:base16_gui0B, g:base16_cterm01, g:base16_cterm0B)
    call Base16hi("SLUnsaved",
        \ g:base16_gui01, g:base16_gui08, g:base16_cterm01, g:base16_cterm08)
    call Base16hi("SLSavedDelim",
        \ g:base16_gui0B, g:base16_gui01, g:base16_cterm0B, g:base16_cterm01)
    call Base16hi("SLUnsavedDelim",
        \ g:base16_gui08, g:base16_gui01, g:base16_cterm08, g:base16_cterm01)
endfunction

