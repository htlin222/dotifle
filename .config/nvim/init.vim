" (hint:  za to open or close the fold)"
" Part.1 ---{{{
set nocompatible
filetype off
" }}}
"
" Part.2 ---set the environment {{{
set number "show the line number"
set shm+=I
set clipboard=unnamed "link the system clipboard to the vim clipboard "
set foldenable "default: manual, see the current setting by  :set foldmethod?
set relativenumber
set autoindent
set nobackup " backup file is immediately deleted upon successfully writing the original file.
set nowritebackup
set noswapfile
set history=100
set showcmd
set noshowmode
set incsearch
set modifiable
set autowriteall
set smartcase
set ignorecase
set incsearch
set hidden
set timeout timeoutlen=500 ttimeoutlen=100
set shiftwidth=4
set tabstop=4
set smarttab
set softtabstop=4
set mouse=a " support mouse
set splitbelow
set splitright
set cursorcolumn
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight SignColumn guibg=darkgrey
highlight clear SignColumn
set autoread
set visualbell
set wildmenu
set encoding=UTF-8
set showmatch
set completefunc=emoji#complete
set completeopt-=preview " For No Previews
set concealcursor-=n " show concealed curse when cursor move to the line
set conceallevel=2
set shortmess=at
set cmdheight=2
filetype plugin indent on
syntax on
" }}}
"
" Part.3 ---map the key {{{
" navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
" switch up/down to half page up and down; left/right to next tab
nnoremap <up> <C-U>zz
nnoremap <down> <C-D>zz
nnoremap <left> :N<CR><Esc>zz
nnoremap <right> :n<CR><Esc>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" j and k navigate visual lines rather than logical ones
nnoremap j gjzz
nnoremap k gkzz
" H remap to the begin of the line, L to the end of line
noremap H ^
noremap L $
" remap enter in normal mode to break a line
nnoremap <CR> i<CR><Esc>
" center the page before entering the insert mode
nnoremap i zzi
nnoremap a zza
nnoremap A zzA
nnoremap o zzo
nnoremap O zzO
" make the indent short
nnoremap > >>
nnoremap < <<
" clear the search result by ctrl+K
nnoremap ? :set hls!<CR>
" text object seletion
nnoremap \w yiw
nnoremap ci( cigg
nnoremap vi( vigg
nnoremap di( digg
" paste under the current line
nnoremap <C-p> :pu<CR>
" insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap ;v <Esc>viw
" jump out of the parenthesis
inoremap <C-e> <C-o>a
" Leader related
" map leader to spacebar
let mapleader=' '
" save and quit
nnoremap <leader>wq :wqa<CR>
nnoremap <leader> :w<CR>
nnoremap <leader>x :q<CR>
" escape to the console
nnoremap <leader>\ <C-z>
" to adjust the window size
nnoremap <leader>jj <C-w>+
nnoremap <leader>kk <C-w>-
nnoremap <leader>hh :vertical resize -10<CR>
nnoremap <leader>ll :vertical resize +10<CR>
" nnoremap <leader>z <C-z>
" leave terminal mode
tnoremap <Esc> <C-\><C-n>
" navigate to other windows by ctrl hjkl
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
" split vertical
nnoremap <leader>; <C-W>s
" split horizontal
nnoremap <leader>` <C-W>v
" open newtrw at the left
nnoremap <leader>t :Lexplore<cr>
" mapping for _vimrc {{{
" inoremap jk <esc>
" }}}
"
" open init.vim
nnoremap <leader>,, :silent e ~/.config/nvim/init.vim<CR>
" reload init.vim
nnoremap <leader>.. :w<CR>:silent source ~/.config/nvim/init.vim<CR>:echo "Vimrc reloaded, 🎉 Have a nice day~"<CR>
"
" plugin dependent mapping================================
" switch input method require im-select
" brew tap daipeihust/tap && brew install im-select
" vimwiki map install vimwiki first {{{
nnoremap ,vs <Plug>VimwikiVSplitLink<CR>
nnoremap ,t :VimwikiTabnewLink<CR>
" }}}
" to toggle plugin via leader
" toggle Vista
nnoremap <leader><leader>v :w<CR>:Vista!!<CR>
" toggle Tagbar
nnoremap <leader>'' :TagbarToggle<CR>
" toggle Undotree
nnoremap <leader>uu :UndotreeToggle<CR>
" toggle Goya
nnoremap <leader>gy :Goyo<CR>
" }}}
"
" Part.4 ---source files {{{
source ~/.config/nvim/abbr.vimrc
source ~/.config/nvim/mysnippets.vimrc
" }}}
"
" Part.5 ---plugin {{{
" 先安裝 https://github.com/junegunn/vim-plug
call plug#begin()
" language----
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc， for autocomplete
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'preservim/vim-markdown'
Plug 'scrooloose/syntastic'
" completion----
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
" code display----
Plug 'lfv89/vim-interestingwords'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
Plug 'frazrepo/vim-rainbow'
" intergration----
Plug 'makerj/vim-pdf'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'yianwillis/vimcdoc' "vimcdoc in Chinese
Plug 'MattesGroeger/vim-bookmarks'
Plug 'wellle/targets.vim'
Plug 'guns/xterm-color-table.vim'
" {{{ require ctags:
" brew install ctags-exuberant
" aud find it's installed in /usr/local/Cellar/ctags/5.8_1
" then I add a line in .vimrc:
" let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'}}}
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" interface----
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'petertriho/nvim-scrollbar'
Plug 'gcmt/taboo.vim'
Plug 'IMOKURI/line-number-interval.nvim'
Plug 'godlygeek/tabular'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'crusoexia/vim-monokai' "monokai colorschemes
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
" commands----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
" others----
Plug 'vimwiki/vimwiki' | Plug 'michal-h21/vimwiki-sync'
Plug 'michal-h21/vim-zettel'
Plug 'itchyny/vim-cursorword'
Plug 'Yggdroot/indentLine'
Plug 'phaazon/hop.nvim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'junegunn/vim-emoji' "Emoji
" Plug to be installed (currently dono how to use it) {{{
" Plug 'w0rp/ale'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'https://github.com/preservim/nerdtree', { 'on':  'NERDTreeToggle' } " NerdTree
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" }}}
" ---Deactivated Plug {{{
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'skywind3000/vim-quickui' "Display a dropdown menubar at top of the screen
" Plug 'aserebryakov/vim-todo-lists'
" Plug 'lyokha/vim-xkbswitch'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'masukomi/vim-markdown-folding'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" }}}
call plug#end()
" }}}
"
" Part.6 ---plugin settings {{{
colorscheme monokai
let g:deoplete#enable_at_startup = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:startify_custom_header = startify#center(['🦎🦎🦎🦎🦎'])
set rtp+=/usr/local/opt/fzf
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" newtrw settings: {{{
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" }}}
" " NERDTree {{{
" nnoremap <leader>t :NERDTreeToggle %<CR>
" " nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" " nerdtree window size
" let g:NERDTreeHijackNetrw=0
" let g:NERDTreeWinSize = 25 "
" let NERDTreeShowBookmarks=1 " -
" " autocmd vimenter * if !argc()|NERDTree|endif " -- 開啟nvim時若沒有任何檔案，則自動開啟nerdtree
" " 當nerdtree為唯一視窗時，自動關閉
" " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " -- 設定樹的圖示,以區分已開啟或未開啟
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeShowLineNumbers=1
" let g:NERDTreeHidden=1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" " -- nerdtree git status  {{{
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"                 \ 'Modified'  :'✹',
"                 \ 'Staged'    :'✚',
"                 \ 'Untracked' :'✭',
"                 \ 'Renamed'   :'➜',
"                 \ 'Unmerged'  :'═',
"                 \ 'Deleted'   :'✖',
"                 \ 'Dirty'     :'✗',
"                 \ 'Ignored'   :'☒',
"                 \ 'Clean'     :'✔︎',
"                 \ 'Unknown'   :'?',
"                 \ }
" " }}}
" " -- color settings {{{
" let s:brown = "905532"
" let s:aqua =  "3AFFDB"
" let s:blue = "689FB6"
" let s:darkBlue = "44788E"
" let s:purple = "834F79"
" let s:lightPurple = "834F79"
" let s:red = "AE403F"
" let s:beige = "F5C06F"
" let s:yellow = "F09F17"
" let s:orange = "D4843E"
" let s:darkOrange = "F16529"
" let s:pink = "CB6F6F"
" let s:salmon = "EE6E73"
" let s:green = "8FAA54"
" let s:lightGreen = "31B53E"
" let s:white = "FFFFFF"
" let s:rspec_red = 'FE405F'
" let s:git_orange = 'F54D27'
" " }}}
" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

" let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
" let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
" " ----END of NERDTree ----
" "  }}}
" " air-line {{{
" let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" " }}}
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
let g:vimwiki_markdown_link_ext = 1
autocmd FileType vimwiki setlocal syntax=markdown
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext=0
let g:vimwiki_sync_branch = "main"
let g:vimwiki_sync_commit_message = 'Auto commit + push. %c'
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
"  vim-markdown-preview {{{
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
" " which-key {{{
" " let g:maplocalleader = ','
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" " }}}
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
" line-number-interval
" {{{
let g:line_number_interval_enable_at_startup = 1
let g:line_number_interval#use_custom = 1
let g:line_number_interval#custom_interval = [1,2,3,4,5,10,20,30,40,50,60,70,80,90]
" }}}
" }}}
"
" Part.7 ---let, path, and function {{{
" path  {{{
" 當出現provider問題時，就來這邊加一下
let g:coc_node_path = '/usr/local/bin/node'
let g:python3_host_prog ='/Users/mac/opt/anaconda3/bin/python3'
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
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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
"
" Part.8 ---autocmd {{{
au BufEnter * set nospell

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
au Bufread *  if expand('%') =~ "zathurarc" | set syntax=vim | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    " \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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
" Imselect
nnoremap <silent> <leader>i :silent !im-select com.boshiamy.inputmethod.BoshiamyIMK<CR>:echo "Input: Boshiamy"<CR>zzi
function! ABC()
  exec ':silent !if \! im-select \| grep -q "ABC" ; then im-select com.apple.keylayout.ABC ; fi'
endfunction
au InsertLeave * :call ABC()
au BufWinEnter * :set shm+=I
" }}}
"
" Part.9 ---user commond! must in uppercase {{{
" Rename File {{{
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>rn :call RenameFile()
" }}}
" Paste Imgur link {{{
function! ImgurLink()
    exec ':silent !python ~/.dotfile/pyscripts/imgurVim.py'
    exec ':silent pu'
endfunction

command! Img :call ImgurLink()
map <leader><leader>p :call ImgurLink()<CR>
" }}}
" }}}
