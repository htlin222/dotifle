" source $HOME/.config/nvim/keys/mappings.vim
" 
" let g:rnvimr_shadow_winblend = 70
" let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0 " Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1} " Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70 " let g:rnvimr_bw_enable = 1 highlight link RnvimrNormal CursorLine
highlight link RnvimrNormal CursorLine
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
