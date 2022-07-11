let g:markdown_syntax_conceal=0
let g:vim_markdown_conceal_code_blocks = 0
"對於markdown fold 的設定：來自[masukomi/vim-markdown-folding: Fold markdown documents by section.](https://github.com/masukomi/vim-markdown-folding)
let g:markdown_folding = 9
if has("autocmd")
    filetype plugin indent on
endif
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
