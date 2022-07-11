set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" :SyntasticCheck phpmd
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
" python pylint
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_exec = 'python'
let g:syntastic_python_args = ['-m', 'py_compile']
