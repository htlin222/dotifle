" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
" Author: Lizard 🦎 Hsiehting Lin (@htlin222)
" (hint:  za to open or close the fold)"
" Part.1 ---{{{
"
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/machine_specific_default.vim ~/.config/nvim/machine_specific.vim"
endif
" }}}
"
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/abbr.vimrc
source $HOME/.config/nvim/mysnippets.vimrc
"
" Part.6 ---plugin settings {{{
" === vim-plug list
source $HOME/.config/nvim/plug-configs/plug-list.vim
" === Undotree
source $HOME/.config/nvim/plug-configs/UndoTree.vim
" === COC
source $HOME/.config/nvim/plug-configs/coc.vim
" === Startify
source $HOME/.config/nvim/plug-configs/startify.vim
" === which-key
source $HOME/.config/nvim/keys/which-key.vim
" === Minimap
source $HOME/.config/nvim/plug-configs/minimap.vim
" === Gitgutter
source $HOME/.config/nvim/plug-configs/GitGutter.vim
" === fzf.vim
source $HOME/.config/nvim/plug-configs/fzf.vim
" === rnvimr
source $HOME/.config/nvim/plug-configs/rnvimr.vim
" === vim-markdown
source $HOME/.config/nvim/plug-configs/vim-markdown.vim
" === lightline
source $HOME/.config/nvim/plug-configs/lightline.vim

let g:ackprg = 'ag --nogroup --nocolor --column'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"
" newtrw settings: {{{
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" }}}
" better-escape {{{
" use jj to escape insert mode.
let g:better_escape_shortcut = 'jj'
" set time interval to 200 ms
let g:better_escape_interval = 200
" enable debug (some message will be shown)
" let g:better_escape_debug = 1
" }}}
" wilder {{{
" Default keys
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
" 'highlighter' : applies highlighting to the candidates
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ 'min_width': '20%',
      \ 'min_height': '10%',
      \ 'border': 'rounded',
      \ 'reverse': 1,
      \ })))
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['rg', '--files'],
      \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
" }}}
" vimwiki {{{
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
    autocmd FileType vimwiki inoremap <silent> [[ [[<esc><Plug>ZettelSearchMap
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
    exec ':s/\%V\W/_/g'
endfunction
function! AppendWithFileName()
    let @*=expand('_')
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
" }}}
" taboo {{{
let g:taboo_tab_format=" %N:%f %m"
let g:taboo_modified_tab_flag="[✏️ ]"
let g:taboo_close_tab_label="[❌]"
" }}}
" indent {{{
let g:indent_guides_enable_on_vim_startup = 1 "讓預設的indent guides 是打開的"
let g:indentLine_concealcursor = "n"
let g:indentLine_setConceal = 0
" }}}
" ultisnips {{{
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets ="<c-tab>"
"设置向后跳转键
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
"设置向前跳转键
" let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
" vim-bookmarks {{{
highlight BookmarkSign ctermbg=235 ctermfg=123
highlight BookmarkAnnotationSign ctermbg=235 ctermfg=22
highlight BookmarkLine ctermbg=235 ctermfg=235
highlight BookmarkAnnotationLine ctermbg=235 ctermfg=235
let g:bookmark_sign = '🔖'
let g:bookmark_annotation_sign = '📣'
let g:bookmark_no_default_key_mappings = 1
" function {{{
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
" }}}
" }}}
" easymotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}
" Not in use plug
" === NERD Tree
" source $HOME/.config/nvim/plug-configs/NERDTree-git.vim
" syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"" :SyntasticCheck phpmd
"let g:syntastic_aggregate_errors = 1
""let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"" python pylint
"let g:syntastic_python_checkers = ['pylint']
""let g:syntastic_python_exec = 'python'
""let g:syntastic_python_args = ['-m', 'py_compile']
" }}}
" }}}
"
" Part.7 ---let, path, and function {{{
" path  {{{
" 當出現provider問題時，就來這邊加一下
let g:Tlist_Ctags_Cmd="/usr/local/ctags"
"}}}
"
" Todo syntax {{{

" Vim syntax file
" Language: Todo
" Maintainer: Huy Tran
" Latest Revision: 14 June 2020

if exists("b:current_syntax")
  finish
endif

" Custom conceal
syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[x\]" conceal cchar=

let b:current_syntax = "todo"

hi def link todoCheckbox Todo
hi Conceal guibg=NONE

setlocal cole=1


" }}}
" }}}
"
" Part.8 ---autocmd {{{
augroup default_group
    autocmd!
    autocmd BufEnter * set nospell
    " highlight the yanked text
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}

    " file formats
    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
    " autocmd Filetype vimwiki set ft=markdown syntax=markdown
    autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

    " specify syntax highlighting for specific files
    autocmd Bufread,BufNewFile *.spv set filetype=php
    autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vimwiki setlocal foldlevel=99
    autocmd Bufread *  if expand('%') =~ "zathurarc" | set syntax=vim | endif
    " Start NERDTree. If a file is specified, move the cursor to its window.
    autocmd StdinReadPre * let s:std_in=1
augroup END
" Run code if is python3
autocmd BufRead,BufNewFile *.py map <leader>r :% w !python3<CR>
" jump to last cursor
autocmd BufReadPost
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
augroup tech_word_to_avoid
    autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
    autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
    autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
    autocmd BufWinLeave * call clearmatches()
augroup END
" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM
" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
augroup Group_SetSpellingColors
    autocmd BufWinEnter * call SetSpellingColors()
    autocmd BufNewFile * call SetSpellingColors()
    autocmd BufRead * call SetSpellingColors()
    autocmd InsertEnter * call SetSpellingColors()
    autocmd InsertLeave * call SetSpellingColors()
augroup END
" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" Imselect
nnoremap <silent> <leader>i :silent !im-select com.boshiamy.inputmethod.BoshiamyIMK<CR>:echo "Input: Boshiamy"<CR>zzi
function! ABC()
  exec ':silent !if \! im-select \| grep -q "ABC" ; then im-select com.apple.keylayout.ABC ; fi'
endfunction

au InsertLeave * :call ABC()
au BufWinEnter * :set shm+=I

function! UpdateTimestamp ()
  '[,']s/^This file last updated: \zs.*/\= strftime("%c") /
endfunction

augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
" }}}
"
" Part.9 ---user commond! MUST IN UPPERCASE {{{
" Rename File {{{
function! Rename()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
" }}}
" Paste Imgur link {{{
function! ImgurLink()
    exec ':silent !python ~/.dotfile/pyscripts/imgurVim.py'
    exec ':silent pu'
endfunction
command! Img :call ImgurLink()
noremap <leader><leader>p :call ImgurLink()<CR>

" }}}
" }}}
"
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/colorscheme.vim

