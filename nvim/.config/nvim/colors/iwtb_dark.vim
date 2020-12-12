"" iwtb_dark (256colors)
"" Author: PHØ
"" WEBSITE: www.nerdbude.com
"" MAIL: post@nerdbude.com

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="iwtb_dark"

" Standartsettings
hi Normal          ctermfg=188     ctermbg=0
hi LineNr          ctermfg=110     ctermbg=none
hi Cursor          ctermfg=188     ctermbg=none
hi CursorLine      ctermfg=none    ctermbg=233  cterm=none
hi CursorLineNR    ctermfg=none    ctermbg=233

" Number column
hi CursorColumn    ctermfg=none    ctermbg=none
hi FoldColumn      ctermfg=none    ctermbg=none
hi SignColumn      ctermfg=none    ctermbg=none
hi Folded          ctermfg=none    ctermbg=none

" Window/Tab delimiters
hi VertSplit       ctermfg=none    ctermbg=none
hi ColorColumn     ctermfg=none    ctermbg=none
hi TabLine         ctermfg=none    ctermbg=none
hi TabLineFill     ctermfg=none    ctermbg=none
hi TabLineSel      ctermfg=none    ctermbg=none

" File Navigation
hi Directory       ctermfg=204     ctermbg=none
hi Search          ctermfg=0       ctermbg=166
hi IncSearch       ctermfg=0       ctermbg=166

" Prompt/Status
hi StatusLine      ctermfg=none    ctermbg=236
hi StatusLineNC    ctermfg=none    ctermbg=233
hi WildMenu        ctermfg=none    ctermbg=none
hi Question        ctermfg=none    ctermbg=none
hi Title           ctermfg=none    ctermbg=none
hi ModeMsg         ctermfg=none    ctermbg=none
hi MoreMsg         ctermfg=none    ctermbg=none

" Visual aid
hi MatchParen      ctermfg=none    ctermbg=none
hi Visual          ctermfg=none    ctermbg=25
hi VisualNOS       ctermfg=none    ctermbg=none
hi NonText         ctermfg=none    ctermbg=none

hi Todo            ctermfg=238     ctermbg=227
hi Underlined      ctermfg=97      ctermbg=none
hi Error           ctermfg=238     ctermbg=203
hi ErrorMsg        ctermfg=238     ctermbg=203
hi WarningMsg      ctermfg=203     ctermbg=none
hi Ignore          ctermfg=188     ctermbg=none
hi SpecialKey      ctermfg=188     ctermbg=none

" Variable types
hi Constant        ctermfg=77      ctermbg=none
hi String          ctermfg=77      ctermbg=none
hi StringDelimiter ctermfg=77      ctermbg=none
hi Character       ctermfg=188     ctermbg=none
hi Number          ctermfg=227     ctermbg=none
hi Boolean         ctermfg=227     ctermbg=none
hi Float           ctermfg=227     ctermbg=none

hi Identifier      ctermfg=77      ctermbg=none
hi Function        ctermfg=77      ctermbg=none

" Constructs
hi Statement       ctermfg=188     ctermbg=none  
hi Conditional     ctermfg=50      ctermbg=none   
hi Repeat          ctermfg=97      ctermbg=none   
hi Label           ctermfg=99      ctermbg=none  
hi Operator        ctermfg=227     ctermbg=none  
hi Keyword         ctermfg=110     ctermbg=none   
hi Exception       ctermfg=110     ctermbg=none   
hi Comment         ctermfg=110     ctermbg=none    

hi Special         ctermfg=204     ctermbg=none  
hi SpecialChar     ctermfg=204     ctermbg=none  
hi Tag             ctermfg=142     ctermbg=none   
hi Delimiter       ctermfg=77      ctermbg=none   
hi SpecialComment  ctermfg=188     ctermbg=none   
hi Debug           ctermfg=204     ctermbg=none   

" C like
hi PreProc         ctermfg=227     ctermbg=none
hi Include         ctermfg=227     ctermbg=none   
hi Define          ctermfg=142     ctermbg=none   
hi Macro           ctermfg=142     ctermbg=none   
hi PreCondit       ctermfg=204     ctermbg=none   

hi Type            ctermfg=77      ctermbg=none  
hi StorageClass    ctermfg=142     ctermbg=none   
hi Structure       ctermfg=142     ctermbg=none   
hi Typedef         ctermfg=77      ctermbg=none   

" Diff
hi DiffAdd         ctermfg=77      ctermbg=none  
hi DiffChange      ctermfg=189     ctermbg=none 
hi DiffDelete      ctermfg=203     ctermbg=none   
hi DiffText        ctermfg=188     ctermbg=none   

" Completion
hi Pmenu           ctermfg=none    ctermbg=none 
hi PmenuSel        ctermfg=none    ctermbg=none   
hi PmenuSbar       ctermfg=none    ctermbg=none   
hi PmenuThumb      ctermfg=none    ctermbg=none   

hi SpellBad        ctermfg=none    ctermbg=none  
hi SpellCap        ctermfg=none    ctermbg=none   
hi SpellLocal      ctermfg=none    ctermbg=none   
hi SpellRare       ctermfg=none    ctermbg=none  

