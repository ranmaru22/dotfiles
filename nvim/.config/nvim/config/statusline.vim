" STATUSLINE SETTINGS

" Buftabline {{{
hi! link BufTabLineCurrent FileName
hi! link BufTabLineActive  GitInfo
hi! link BufTabLineHidden  LineFormatRight
hi! link BufTabLineFill    CocBar
let g:buftabline_separators = "on"
" }}}

" Spaceline {{{
hi! HomeMode gui=bold
let g:spaceline_seperate_style= 'arrow-fade'
let g:spaceline_colorscheme = 'space'
let g:spaceline_git_branch_icon = ' '
let g:spaceline_funcicon = ' '
let g:spaceline_diagnostic_warnsign = '!'
let g:spaceline_diagnostic_errorsign = '✘'
let g:spaceline_custom_vim_status = {
    \ "n":"NORMAL ",
    \ "V":"V-LINE ", "v":"VISUAL ", "\<C-v>":"V-BLOCK ",
    \ "i":"INSERT ", "R":"REPLACE ",
    \ "s":"SELECT ", "t":"TERM ", "c":"COMMAND ", "!":"SE "
    \ }
let g:spaceline_custom_diff_icon = [' ', ' ', ' ']
let g:spaceline_scroll_bar_chars = ['⎺', '⎻', '─', '⎼', '⎽']
" }}}

" vim:foldmethod=marker:foldlevel=0
