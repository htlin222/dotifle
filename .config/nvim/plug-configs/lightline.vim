
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' , 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': '我是一隻臭蜴🦎',
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }


function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" function! LightlineFilename()
"   let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
"   let modified = &modified ? ' +' : ''
"   return filename . modified
" endfunction
