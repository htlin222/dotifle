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

colorscheme monokai

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

" === Pmenu colorscheme ===

" PaperColor Pemenu
" hi Pmenu guifg=#ffffd7 guibg=#262626
" hi PmenuSel guifg=#262626 guibg=#ffff5f gui=bold

" DarkSpace Pmenu
hi Pmenu guifg=#949494 guibg=#262626 gui=bold
hi PmenuSel guifg=#262626 guibg=#875faf gui=bold

" === Minimap colorscheme ===
let g:minimap_highlight = 'MinimapCurrentLine'

" DarkSpace Minimap
hi MinimapCurrentLine ctermfg=48 guifg=#af5faf guibg=#262626 ctermbg=235 gui=bold

