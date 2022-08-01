" Colorscheme
if !has('gui_running')
  set t_Co=256
endif
set background=dark

" colorscheme PaperColor
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight SignColumn guibg=darkgrey
highlight clear SignColumn

" === Color Options ===

" 235 -- Grey15         --- #262626
" 255 -- White          --- #eeeeee
" 121 -- PaleGreen1     --- #87ffaf
" 85  -- SpringGreen1   --- #5fffaf
" 230 -- Cornskil1      --- #ffffd7
" 229 -- Weat1          --- #ffffaf
" 158 -- DarkSeaGreen3  --- #87d7af
" 227 -- LightGoldenrod1--- #ffff5f
" 133 -- MediumOrchid3  --- #af5faf
" 92  -- MediumPurple3  --- #875faf

" =====================

colorscheme monokai

" === Pmenu colorscheme ===

" PaperColor Pemenu
" hi Pmenu guifg=#ffffd7 guibg=#262626
" hi PmenuSel guifg=#262626 guibg=#ffff5f gui=bold

" DarkSpace Pmenu
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi! PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

" === Minimap colorscheme ===
let g:minimap_highlight = 'MinimapCurrentLine'

" DarkSpace Minimap
hi MinimapCurrentLine ctermfg=48 guifg=#af5faf guibg=#262626 ctermbg=235 gui=bold

