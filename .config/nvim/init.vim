:echo "你好！🦎"
" (小技巧：可以在normal mode下用za來打開或關閉各個Fold)"
" Part.1 ---在一開始載入的東西{{{
" }}}
" Part.2 ---set各種基本配置 {{{
set nocompatible
filetype off
set number "顯示行號"
set clipboard=unnamed "將vim的剪貼版跟系統綁定"
set foldenable "可以折起程式碼，預設是manual，可以透過set foldmethod?來查看
set relativenumber "相對行號
set autoindent
set tabstop=4
set nobackup
set nowritebackup
set noswapfile
set history=100
set showcmd
set incsearch
set smartcase
set ignorecase
set incsearch
set hidden
" Turn word wrap off
" set nowrap
set timeout timeoutlen=1000 ttimeoutlen=100
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a "支援滑鼠
set splitbelow
set splitright
set cursorcolumn
set cursorline
set autoread
set visualbell
set wildmenu
set encoding=UTF-8
set showmatch
set completefunc=emoji#complete
set completeopt-=preview " For No Previews
set concealcursor-=n
set conceallevel=2
set shortmess=at
set cmdheight=3
filetype plugin indent on
" 開啟語法高亮
syntax on
" }}}
" Part.3 ---map各種鍵位的改變 {{{
" 改Leader改成空白鍵，預設是\
" 關於CursorLine的設定
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" 在不同視窗中的navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
" 鍵盤上的「上下左右」方向鍵不用白不用，我拿來將上下改為翻頁且置中、左右改為前後分頁切換且置中
nnoremap <up> <C-U>zz
nnoremap <down> <C-D>zz
nnoremap <left> :N<CR><Esc>zz
nnoremap <right> :n<CR><Esc>zz
" j and k navigate visual lines rather than logical ones
nnoremap j gj
nnoremap k gk
nmap H ^
nmap L $
nnoremap <CR> i<CR><Esc>
nnoremap i zzi
nnoremap a zza
nnoremap o zzo
nnoremap O zzO
nnoremap <C-k> :set hls!<CR>
" 在insert mode 中，ctrl hjkl做為上下左右
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap ;v <Esc>viw
inoremap aa <Esc>
inoremap <C-e> <C-o>a
" 為了讓換行時不要退出輸入法，所以改enter改成這樣
inoremap <CR> <C-o>o
" Leader related
let mapleader=' '
nmap <leader>wq :wq<CR>
" 在正常模式下，用以下鍵位來調整目前的視窗大小
nnoremap <leader>jj <C-w>+
nnoremap <leader>kk <C-w>-
nnoremap <leader>hh :vertical resize -1<CR>
nnoremap <leader>ll :vertical resize +1<CR>
" 在下面一行貼上
nnoremap <C-p> :pu<CR>
" TODO:弄懂一下這行在幹麻
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
" Vim 視窗分割
map <leader>; <C-W>s
map <leader>` <C-W>v

" map <leader>. :Vexplore<cr> "有NREDTree後就沒那麼實用了"
" 開啟_vimrc的快捷鍵 {{{
"
" }}}
"
" 重新載入開啟init.vim 的快捷鍵
map <leader>, :e ~/.config/nvim/init.vim<CR>
" 重新讀取當前的init.vim
map <leader>. :w<CR>:source ~/.config/nvim/init.vim<CR>:echo "已更新vim的設定了，🎉祝你有個愉快的一天"<CR>
" 如果還是怪怪的，建議全關掉後重啟，說不定可以解決你的問題
"
" 以下是要裝額外的外掛才能用的一些指令================================
" 不同情況的輸入法切換
nnoremap <silent> <leader>i :!im-select com.boshiamy.inputmethod.BoshiamyIMK<CR>:echo "嘸蝦米輸入法"<CR>zzi
inoremap <silent> <Esc> <Esc>:!if \! im-select \| grep -q 'ABC' ; then im-select com.apple.keylayout.ABC ; fi <CR>:echo "正常模式🥰"<CR>
" vimwiki map {{{
nmap <leader>vs <Plug>VimwikiVSplitLink
nmap ,t :VimwikiTabnewLink<CR>
" }}}
" 用leader p來開啟vista, 即可以顯示markdown大綱的plugin
nnoremap <leader>p :w<CR>:Vista<CR>
" 在寫程式時好用的Tagbar，安裝時請看下面Plugin部分的說明
nmap <leader>'' :TagbarToggle<CR>
" Undotree, 可以看見編輯的紀錄，好用
nmap <leader>u :UndotreeToggle<CR>
" }}}
" Part.4 ---外部檔案 {{{
" 我的各種縮寫，目前沒什麼東西，主要是用espanso來代替
iab greet Hellow 🦎
source ~/.config/nvim/abbr.vimrc
source ~/.config/nvim/mysnippets.vimrc
" }}}
" Part.5 ---Plugin {{{
" 先安裝 https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc， for autocomplete
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vimwiki/vimwiki' " vimwiki ，個人在vim裡的wiki
Plug 'junegunn/fzf' "Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
" [undotree/undotree.vim at master · mbbill/undotree](https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L15)
Plug 'petertriho/nvim-scrollbar'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
Plug 'gcmt/taboo.vim'
Plug 'makerj/vim-pdf'
Plug 'michal-h21/vim-zettel'
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'junegunn/vim-emoji' "Emoji
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" {{{ 需要先安裝ctags:
" brew install ctags-exuberant
" aud find it's installed in /usr/local/Cellar/ctags/5.8_1
" then I add a line in .vimrc:
" let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'}}}
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'yianwillis/vimcdoc' "vimcdoc提供了vim的中文文件
Plug 'liuchengxu/vista.vim' "用:vista 來開啟，右邊顯示toc
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'aserebryakov/vim-todo-lists'
Plug 'crusoexia/vim-monokai' "monokai顏色主題
Plug 'vim-airline/vim-airline' "下面那段airline
Plug 'vim-airline/vim-airline-themes' " airline 的顏色主題
Plug 'jiangmiao/auto-pairs'
Plug 'michal-h21/vimwiki-sync'
Plug 'ThePrimeagen/vim-be-good'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" ---Deactivated Plug {{{
" Plug 'skywind3000/vim-quickui' "Display a dropdown menubar at top of the screen
" Plug 'lyokha/vim-xkbswitch'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'masukomi/vim-markdown-folding'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" }}}
" 注意，所有的plugin都要在這個call裡面
call plug#end()
" }}}
" Part.6 ---Plugin各別設定 {{{
" 主題選用monokai
colorscheme monokai
" ---NERDTree {{{
"-----從這開始是 nerdtree配置 ------------
nnoremap <leader>t :NERDTreeToggle %<CR>
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" -- 設定nerdtree的視窗大小
let g:NERDTreeWinSize = 25 " -- 設定nerdtree的視窗大小
let NERDTreeShowBookmarks=1 " -- 開啟nerdtree時自動顯示bookmarks
autocmd vimenter * if !argc()|NERDTree|endif " -- 開啟nvim時若沒有任何檔案，則自動開啟nerdtree
" -- 當nerdtree為唯一視窗時，自動關閉
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" -- 設定樹的圖示,以區分已開啟或未開啟
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" -- 是否顯示行號
let g:NERDTreeShowLineNumbers=0
" -- 是否顯示隱藏檔案
let g:NERDTreeHidden=0
" -- 讓nerdtree更漂亮
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" -- 過濾不顯示的檔案
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" -- nerdtree的git檔案狀設定 {{{
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
" }}}
" -- 為不同的檔案進行不同的高亮上色 {{{
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" }}}
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
" ----END of NERDTree ----
"  }}}
" ---air-line {{{
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}
" gitgutter settings: {{{
let g:gitgutter_sign_added = '㊉'
" let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = '㊀'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_removed_above_and_below = '{'
" let g:gitgutter_sign_modified_removed = 'ww'
" }}}
" vimwiki {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = 'expr'
let g:vimwiki_markdown_link_ext = 1
autocmd FileType vimwiki setlocal syntax=markdown filetype=markdown
autocmd FileType vimwiki setlocal foldenable
autocmd FileType vim setlocal foldmethod=marker
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
" " vim-markdown-preview {{{
" " set to 1, nvim will open the preview window after entering the markdown buffer
" " default: 0
" let g:mkdp_auto_start = 0

" " set to 1, the nvim will auto close current preview window when change
" " from markdown buffer to another buffer
" " default: 1
" let g:mkdp_auto_close = 0

" " set to 1, the vim will refresh markdown when save the buffer or
" " leave from insert mode, default 0 is auto refresh markdown as you edit or
" " move the cursor
" " default: 0
" let g:mkdp_refresh_slow = 0

" " set to 1, the MarkdownPreview command can be use for all files,
" " by default it can be use in markdown file
" " default: 0
" let g:mkdp_command_for_global = 0

" " set to 1, preview server available to others in your network
" " by default, the server listens on localhost (127.0.0.1)
" " default: 0
" let g:mkdp_open_to_the_world = 0

" " use custom IP to open preview page
" " useful when you work in remote vim and preview on local browser
" " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" " default empty
" let g:mkdp_open_ip = ''

" " specify browser to open preview page
" " for path with space
" " valid: `/path/with\ space/xxx`
" " invalid: `/path/with\\ space/xxx`
" " default: ''
" let g:mkdp_browser = ''

" " set to 1, echo preview page url in command line when open preview page
" " default is 0
" let g:mkdp_echo_preview_url = 1

" " a custom vim function name to open preview page
" " this function will receive url as param
" " default is empty
" let g:mkdp_browserfunc = ''

" " options for markdown render
" " mkit: markdown-it options for render
" " katex: katex options for math
" " uml: markdown-it-plantuml options
" " maid: mermaid options
" " disable_sync_scroll: if disable sync scroll, default 0
" " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
" "   middle: mean the cursor position alway show at the middle of the preview page
" "   top: mean the vim top viewport alway show at the top of the preview page
" "   relative: mean the cursor position alway show at the relative positon of the preview page
" " hide_yaml_meta: if hide yaml metadata, default is 1
" " sequence_diagrams: js-sequence-diagrams options
" " content_editable: if enable content editable for preview page, default: v:false
" " disable_filename: if disable filename header for preview page, default: 0
" let g:mkdp_preview_options = {
"     \ 'mkit': {},
"     \ 'katex': {},
"     \ 'uml': {},
"     \ 'maid': {},
"     \ 'disable_sync_scroll': 0,
"     \ 'sync_scroll_type': 'middle',
"     \ 'hide_yaml_meta': 1,
"     \ 'sequence_diagrams': {},
"     \ 'flowchart_diagrams': {},
"     \ 'content_editable': v:false,
"     \ 'disable_filename': 0,
"     \ 'toc': {}
"     \ }

" " use a custom markdown style must be absolute path
" " like '/Users/username/markdown.css' or expand('~/markdown.css')
" let g:mkdp_markdown_css = ''

" " use a custom highlight style must absolute path
" " like '/Users/username/highlight.css' or expand('~/highlight.css')
" let g:mkdp_highlight_css = ''

" " use a custom port to start server or empty for random
" let g:mkdp_port = ''

" " preview page title
" " ${name} will be replace with the file name
" let g:mkdp_page_title = '「${name}」'

" " recognized filetypes
" " these filetypes will have MarkdownPreview... commands
" let g:mkdp_filetypes = ['markdown']

" " set default theme (dark or light)
" " By default the theme is define according to the preferences of the system
" let g:mkdp_theme = 'dark'
" " }}}
" }}}
" Part.7 ---其他設定 {{{
" path  {{{
" 當出現provider問題時，就來這邊加一下
let g:coc_node_path = '/usr/local/bin/node'
let g:python3_host_prog ='/usr/local/Cellar/python@3.9/3.9.13_1/bin/python3'
let g:Tlist_Ctags_Cmd="/usr/local/ctags"
"}}}
let g:markdown_syntax_conceal=0
let g:vim_markdown_conceal_code_blocks = 0
" markdown folding setting {{{
"對於markdown fold 的設定：來自[masukomi/vim-markdown-folding: Fold markdown documents by section.](https://github.com/masukomi/vim-markdown-folding)
let g:markdown_folding = 9
if has("autocmd")
    filetype plugin indent on
endif
" }}}
"  停用:setting for switch input method {{{
" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" let g:XkbSwitchNLayout = 'us'
" autocmd BufEnter * let g:XkbSwitchILayout = 'us'
" }}}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Autocomplete Setting {{{
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" --- Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}
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
" Part.8 ---autocmd {{{
" Run code if is python3
autocmd BufRead,BufNewFile *.py map <leader>r :% w !python3<CR>
" If you'd like to have it default to Nested folding
" autocmd FileType markdown set foldexpr=NestedMarkdownFolds()
" autocmd FileType vimwiki set foldexpr=NestedMarkdownFolds()
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

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
" autocmd Filetype vimwiki set ft=markdown syntax=markdown
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
au Bufread *  if expand('%') =~ "zathurarc" | set syntax=vim | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd BufWinLeave * call clearmatches()

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
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}
" Part.9 ---User Command! {{{
" 不會寫…command! -n=0 -bar reload :source ~/.config/nvim/init.vim
" }}}
