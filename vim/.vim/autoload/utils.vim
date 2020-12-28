" UTILITY FUNCTIONS

function! utils#foldtext() abort
    let l:linecount = "[" . (v:foldend - v:foldstart + 1) . "ℓ]"
    let l:line = getline(v:foldstart)
    return l:line . ' :: ' . l:linecount . ' '
endfunction

function! utils#hasPlugin(plugin)
    return isdirectory(g:plug_home . "/" . a:plugin)
        \ && index(keys(g:plugs), a:plugin) >= 0
endfunction

function! utils#setColours() abort
    let l:sl = split(execute('hi StatusLine'), '[\n =]')

    let l:guifg   = index(l:sl, 'guifg') > -1 ? l:sl[index(l:sl, 'guifg') + 1] : 'NONE'
    let l:guibg   = index(l:sl, 'guibg') > -1 ? l:sl[index(l:sl, 'guibg') + 1] : 'NONE'
    let l:ctermfg = index(l:sl, 'ctermfg') > -1 ? l:sl[index(l:sl, 'ctermfg') + 1] : 'NONE'
    let l:ctermbg = index(l:sl, 'ctermbg') > -1 ? l:sl[index(l:sl, 'ctermbg') + 1] : 'NONE'

    let l:sl_fg = { 'gui': l:guifg, 'cterm': l:ctermfg }
    let l:sl_bg = { 'gui': l:guibg, 'cterm': l:ctermbg }

    " Base StatusLine
    " 1* Muted, 2* Italic, 3* Bold, 4* Muted Italic, 5* Muted Bold
    execute 'hi User1 guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_muted.gui . ' gui=NONE ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_muted.cterm . ' cterm=NONE'
    execute 'hi User2 guibg=' . l:sl_bg.gui . ' guifg=' . l:sl_fg.gui . ' gui=italic ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . l:sl_fg.cterm . ' cterm=italic'
    execute 'hi User3 guibg=' . l:sl_bg.gui . ' guifg=' . l:sl_fg.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . l:sl_fg.cterm . ' cterm=bold'
    execute 'hi User4 guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_muted.gui . ' gui=italic ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_muted.cterm . ' cterm=italic'
    execute 'hi User5 guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_muted.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_muted.cterm . ' cterm=bold'
    " Extra colours for fancy shmancy stuff
    execute 'hi UserGreen  guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_green.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_green.cterm . ' cterm=bold'
    execute 'hi UserBlue   guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_blue.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_blue.cterm . ' cterm=bold'
    execute 'hi UserYellow guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_yellow.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_yellow.cterm . ' cterm=bold'
    execute 'hi UserRed    guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_red.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_red.cterm . ' cterm=bold'
    execute 'hi UserTeal   guibg=' . l:sl_bg.gui . ' guifg=' . g:sl_teal.gui . ' gui=bold ctermbg=' . l:sl_bg.cterm . ' ctermfg=' . g:sl_teal.cterm . ' cterm=bold'
    " Use muted for trailing whitespace highlighting
    execute 'hi TrailingWhitespace guifg=' . g:sl_muted.gui . ' ctermfg=' . g:sl_muted.cterm
    " LSP colours if not defined
    execute 'hi default LspDiagnosticsDefaultError guifg=' . g:sl_red.gui . ' ctermfg=' . g:sl_red.cterm
    execute 'hi default LspDiagnosticsDefaultWarning guifg=' . g:sl_yellow.gui . ' ctermfg=' . g:sl_yellow.cterm
    execute 'hi default LspDiagnosticsDefaultHint guifg=' . g:sl_blue.gui . ' ctermfg=' . g:sl_blue.cterm
    execute 'hi default LspDiagnosticsDefaultInformation guifg=' . g:sl_teal.gui . ' ctermfg=' . g:sl_teal.cterm
endfunction
