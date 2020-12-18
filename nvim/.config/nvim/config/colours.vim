" COLOUR SETTINGS

set t_Co=256

if exists("+termguicolors")
    set termguicolors
endif

set background=dark
let ayucolor="dark"
let g:edge_sign_column_background = 'none'
let g:edge_current_word = 'bold'
colorscheme edge

let g:sl_bg     = { 'gui': '#38373a', 'cterm': '233' }
let g:sl_fg     = { 'gui': '#c5cdd9', 'cterm': '252' }
let g:sl_muted  = { 'gui': '#88909f', 'cterm': '244' }

let g:sl_green  = { 'gui': '#a0c980', 'cterm': '010' }
let g:sl_red    = { 'gui': '#ec7279', 'cterm': '009' }
let g:sl_yellow = { 'gui': '#deb974', 'cterm': '011' }
let g:sl_blue   = { 'gui': '#6cb6eb', 'cterm': '012' }
let g:sl_teal   = { 'gui': '#5dbbc1', 'cterm': '014' }

function! SetColours() abort
    " Base StatusLine
    execute 'hi StatusLine guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_fg.gui . ' ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_fg.cterm . ' cterm=NONE'
    " 1* Muted, 2* Italic, 3* Bold, 4* Muted Italic, 5* Muted Bold
    execute 'hi User1 guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_muted.gui . ' gui=NONE ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_muted.cterm . ' cterm=NONE'
    execute 'hi User2 guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_fg.gui . ' gui=italic ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_fg.cterm . ' cterm=italic'
    execute 'hi User3 guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_fg.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_fg.cterm . ' cterm=bold'
    execute 'hi User4 guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_muted.gui . ' gui=italic ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_muted.cterm . ' cterm=italic'
    execute 'hi User5 guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_muted.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_muted.cterm . ' cterm=bold'
    " Extra colours for fancy shmancy stuff
    execute 'hi UserGreen  guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_green.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_green.cterm . ' cterm=bold'
    execute 'hi UserBlue   guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_blue.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_blue.cterm . ' cterm=bold'
    execute 'hi UserYellow guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_yellow.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_yellow.cterm . ' cterm=bold'
    execute 'hi UserRed    guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_red.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_red.cterm . ' cterm=bold'
    execute 'hi UserTeal   guibg=' . g:sl_bg.gui . ' guifg=' . g:sl_teal.gui . ' gui=bold ctermbg=' . g:sl_bg.cterm . ' ctermfg=' . g:sl_teal.cterm . ' cterm=bold'
    " Use muted for trailing whitespace highlighting
    execute 'hi TrailingWhitespace guifg=' . g:sl_muted.gui . ' ctermfg=' . g:sl_muted.cterm
    " LSP colours if not defined
    execute 'hi default LspDiagnosticsDefaultError guifg=' . g:sl_red.gui . ' ctermfg=' . g:sl_red.cterm
    execute 'hi default LspDiagnosticsDefaultWarning guifg=' . g:sl_yellow.gui . ' ctermfg=' . g:sl_yellow.cterm
    execute 'hi default LspDiagnosticsDefaultHint guifg=' . g:sl_blue.gui . ' ctermfg=' . g:sl_blue.cterm
    execute 'hi default LspDiagnosticsDefaultInformation guifg=' . g:sl_teal.gui . ' ctermfg=' . g:sl_teal.cterm
endfunction

call SetColours()

" Missing colours {{{
match TrailingWhitespace /\s\+$/

" vim:foldmethod=marker
