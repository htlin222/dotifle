let wiki_1 = {'path': '~/Documents/Medical', 'name': 'Medical',
                      \ 'syntax': 'markdown', 'ext': '.md'}
let wiki_2 = {'path': '~/vimwiki/', 'name': 'Tech',
                      \ 'syntax': 'markdown', 'ext': '.md'}
let g:vimwiki_list = [wiki_1,wiki_2]
let g:nv_search_paths = ['~/Documents/Medical/','~/vimwiki']
let g:vimwiki_markdown_link_ext = 1
autocmd FileType vimwiki setlocal syntax=markdown
let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_header=1
let g:vimwiki_global_ext=0
let g:vimwiki_sync_branch = "main"
let g:vimwiki_sync_commit_message = 'Auto commit + push. %c'
let g:zettel_default_mappings = 0
" This is basically the same as the default configuration
augroup filetype_vimwiki
    autocmd!
    autocmd FileType vimwiki inoremap <silent>\[[ [[<esc><Plug>ZettelSearchMap
    autocmd FileType vimwiki nnoremap T <Plug>ZettelYankNameMap
    autocmd FileType vimwiki xnoremap z <Plug>ZettelNewSelectedMap
    autocmd FileType vimwiki nnoremap gZ <Plug>ZettelReplaceFileWithLink
    autocmd FileType vimwiki nnoremap <leader>wb :ZettelBackLinks<CR>
    autocmd FileType vimwiki nnoremap <leader>wv <Plug>VimwikiVSplitLink<CR>
    autocmd FileType vimwiki nnoremap <leader>wnt <Plug>VimwikiTabnewLink<CR>
    autocmd FileType vimwiki nnoremap <leader>wnz <Plug>ZettelNew<CR>
    autocmd FileType vimwiki nnoremap <leader>wni <Plug>ZettelInsertNote<CR>
    autocmd FileType vimwiki nnoremap <silent><leader>wf e:call AppendWithFileName()<CR>p
    autocmd FileType vimwiki xnoremap <silent><leader>wx :call ReplaceSpace()<CR>
    autocmd FileType vimwiki nnoremap <silent>\8 I*<space><esc>
    autocmd FileType vimwiki nnoremap <silent>\- I-<space><esc>
    autocmd FileType vimwiki xnoremap <silent>\8 I*<space><esc>
    autocmd FileType vimwiki xnoremap <silent>\- I-<space><esc>
augroup END
let g:zettel_format = "%raw_title"
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_generated_index_title_level = 2
let g:zettel_backlinks_title = "相關連結："
let g:zettel_backlinks_title_level = 3
let g:zettel_generated_tags_title = "Tags"
let g:zettel_generated_tags_title_level = 3
let g:zettel_options = [{"template" : "~/.dotfile/.config/nvim/snippets/template.tpl" , "disable_front_matter": 1 }]
function! ReplaceSpace()
    exec ':s/\%V\W/-/g'
endfunction
function! AppendWithFileName()
    let @*=expand('-')
    let @+ .=expand('%:t:r')
endfunction
" Sample template: >
"    = %title =
"    %backlink
"    %footer
 " text from the parent note footer. Footer is separated from  the
 " main text by horizontal rule  (----). It can contain some information
 " shared by notes. For example notes about publication can share citation of
 " that publication.
