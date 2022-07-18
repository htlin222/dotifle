" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
" Author: Lizard 🦎 Hsiehting Lin (@htlin222)
" (hint: za to open or close the fold)"
"
" INITAL SETUP ---{{{
"
" === Auto load for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/machine_specific_default.vim ~/.config/nvim/machine_specific.vim"
endif
" }}}
"
" PLUGIN SETTINGS {{{
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
" === vimwiki
source $HOME/.config/nvim/plug-configs/vimwiki.vim
" === wilder
source $HOME/.config/nvim/plug-configs/wilder.vim
" === easymotion.vim
source $HOME/.config/nvim/plug-configs/easymotion.vim
" === plug-configs/todo.vim
source $HOME/.config/nvim/plug-configs/todo.vim
" === plug-configs/lsp.vim
source $HOME/.config/nvim/plug-configs/lsp.vim
" === plug-configs/surround.vim
source $HOME/.config/nvim/plug-configs/surround.vim

let g:ackprg = 'ag --nogroup --nocolor --column'

" === Goyo {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}
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
" " vim-bookmarks {{{
" highlight BookmarkSign ctermbg=235 ctermfg=123
" highlight BookmarkAnnotationSign ctermbg=235 ctermfg=22
" highlight BookmarkLine ctermbg=235 ctermfg=235
" highlight BookmarkAnnotationLine ctermbg=235 ctermfg=235
" let g:bookmark_sign = '🔖'
" let g:bookmark_annotation_sign = '📣'
" let g:bookmark_no_default_key_mappings = 1
" " function {{{
" function! BookmarkMapKeys()
"     nmap mm :BookmarkToggle<CR>
"     nmap mi :BookmarkAnnotate<CR>
"     nmap mn :BookmarkNext<CR>
"     nmap mp :BookmarkPrev<CR>
"     nmap ma :BookmarkShowAll<CR>
"     nmap mc :BookmarkClear<CR>
"     nmap mx :BookmarkClearAll<CR>
"     nmap mkk :BookmarkMoveUp
"     nmap mjj :BookmarkMoveDown
" endfunction
" function! BookmarkUnmapKeys()
"     unmap mm
"     unmap mi
"     unmap mn
"     unmap mp
"     unmap ma
"     unmap mc
"     unmap mx
"     unmap mkk
"     unmap mjj
" endfunction
" autocmd BufEnter * :call BookmarkMapKeys()
" autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
" " }}}
" " }}}
" Not in use plug settings
" source $HOME/.config/nvim/plug-configs/NERDTree-git.vim
" source $HOME/.config/nvim/plug-configs/syntastic.vim
" }}}
"
" AUTOCMD {{{
" default group{{{
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
"}}}
" Run code if is python3{{{
autocmd BufRead,BufNewFile *.py map <leader>r :% w !python3<CR>
" jump to last cursor
autocmd BufReadPost
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
"}}}
" StripTrailingWhitespace {{{
fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
" }}}
" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/{{{
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
augroup tech_word_to_avoid
    autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
    autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
    autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
    autocmd BufWinLeave * call clearmatches()
augroup END
"}}}
" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window{{{
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
endfunction
"}}}
" Close all folds when opening a new buffer
" Rainbow parenthesis always on!{{{
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif
"}}}
" Reset spelling colours when reading a new buffer{{{
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
"}}}
" Change colourscheme when diffing{{{
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
"}}}
" Imselect {{{
nnoremap <silent> <leader>i :silent !im-select com.boshiamy.inputmethod.BoshiamyIMK<CR>:echo "Input: Boshiamy"<CR>zzi
function! ABC()
  exec ':silent !if \! im-select \| grep -q "ABC" ; then im-select com.apple.keylayout.ABC ; fi'
endfunction

au InsertLeave * :call ABC()
au BufWinEnter * :set shm+=I
"}}}
" auto mkdir{{{
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
"}}}
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM
" }}}
"
" COMMOND! MUST IN UPPERCASE {{{
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
function! UpdateTimestamp ()
  '[,']s/^This file last updated: \zs.*/\= strftime("%c") /
endfunction
" }}}
"
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/colorscheme.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/abbr.vimrc
source $HOME/.config/nvim/keys/mysnippets.vim
