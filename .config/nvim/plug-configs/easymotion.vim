let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nnoremap f <Plug>(easymotion-overwin-f2)
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nnoremap <leader>f <Plug>(easymotion-overwin-f1)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
nnoremap <Leader>j <Plug>(easymotion-j)
nnoremap <Leader>k <Plug>(easymotion-k)
