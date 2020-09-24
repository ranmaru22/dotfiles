" SYNTAX-RELATED SETTINGS

" Assembler {{{
let g:asmsyntax = 'nasm'                    " set nasm as default assembler syntax
" }}}

" Haskell {{{
let g:haskell_enable_quantification = 1     " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1        " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1        " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1          " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1    " to enable highlighting of `static`
let g:haskell_indent_guard = 4
" }}}

" Markdown {{{
let g:vim_markdown_conceal = 2              " to avoid folding of links
let g:vim_markdown_conceal_code_blocks = 0  " to avoid folding of code blocks
let g:vim_markdown_math = 1                 " formatting options
let g:vim_markdown_toml_frontmatter = 1     " |
let g:vim_markdown_frontmatter = 1          " |
let g:vim_markdown_strikethrough = 1        " |
let g:vim_markdown_autowrite = 1            " |
let g:vim_markdown_edit_url_in = 'tab'      " |
let g:vim_markdown_follow_anchor = 1        " |
" }}}

" vim:foldmethod=marker:foldlevel=0
