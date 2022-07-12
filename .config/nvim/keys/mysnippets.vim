" Insert the template
command! Temp :-1r $HOME/.dotfile/.config/nvim/snippets/template |
            \ normal Gi<C-R>=strftime("* %y-%m-%d %H:%M")<CR><Esc>gg
" Set file name as title
command! SetT silent normal ggO<C-R>=expand("%:t:r")<CR>
