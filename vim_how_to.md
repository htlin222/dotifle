# vim how to 
## vimwiki shortcut
* <leader>ww wiki wiki 
* <leader>wt open wiki in new tab
* <leader>w<leader>w open/create today diary
* <leader>w<keader>t open/create today diary in new tab
* <leader>ws wiki list  

inoremap <silent> [[ [[<esc><Plug>ZettelSearchMap
nnoremap <leader>wb :ZettelBackLinks<CR>
nnoremap <leader>wni <Plug>ZettelInsertNote<CR>
nnoremap <leader>wnt <Plug>VimwikiTabnewLink<CR>
nnoremap <leader>wnz <Plug>ZettelNew<CR>
nnoremap <leader>wv <Plug>VimwikiVSplitLink<CR>
nnoremap <silent><leader>wf e:call AppendWithFileName()<CR>p
nnoremap T <Plug>ZettelYankNameMap
nnoremap gZ <Plug>ZettelReplaceFileWithLink
xnoremap <silent><leader>wrs :call ReplaceSpace()<CR>
xnoremap z <Plug>ZettelNewSelectedMap
