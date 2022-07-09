" (hint:  za to open or close the fold)"
" Part.1 ---{{{
set nocompatible
filetype off
" }}}
"
" Part.2 ---set the environment {{{
set autoindent autoread autowriteall
set clipboard=unnamed "link the system clipboard to the vim clipboard "
set cmdheight=2
set completefunc=emoji#complete
set completeopt-=preview " For No Previews
set concealcursor-=n " show concealed curse when cursor move to the line
set conceallevel=2
set cursorcolumn cursorline
set encoding=UTF-8
set foldenable "default: manual, see the current setting by  :set foldmethod?
set hidden
set history=100
set ignorecase
set incsearch
set modifiable
set mouse=a " support mouse
set nobackup " backup file is immediately deleted upon successfully writing the original file.
set noshowmode noswapfile nowritebackup
set number "show the line number"
set relativenumber
set shiftround shiftwidth=4
set shm+=I
set shortmess=at
set showcmd showmatch
set smartcase smarttab
set softtabstop=4
set splitbelow splitright
set tabstop=4
set timeout timeoutlen=500 ttimeoutlen=100
set visualbell
set wildmenu
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight SignColumn guibg=darkgrey
highlight clear SignColumn
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
" paste under the current line
nnoremap <c-p> :pu<CR>
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
" clear the search result by ctrl+K 96
nnoremap <silent>? :set hls!<CR>
" text object seletion
nnoremap \ dd
nnoremap ci( cigg
nnoremap vi( vigg
nnoremap di( digg
" insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap ;v <Esc>viw
inoremap <C-d> <C-O>D
" jump out of the parenthesis
inoremap <C-e> <C-o>a
" Leader related
" map leader to spacebar
let mapleader=' '
" save and quit
nnoremap <leader>wq :wqa<CR>
" nnoremap <leader> :w<CR>
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
tnoremap <Esc><Esc> <C-\><C-n>
" navigate to other windows by ctrl hjkl
" tnoremap <C-j> <C-\><C-n><C-w><C-j>
" tnoremap <C-k> <C-\><C-n><C-w><C-k>
" tnoremap <C-l> <C-\><C-n><C-w><C-l>
" tnoremap <C-h> <C-\><C-n><C-w><C-h>
" split vertical
nnoremap <leader>; <C-W>s
" split horizontal
nnoremap <leader>` <C-W>v
" open newtrw at the
nnoremap <leader>t :Lexplore<cr>
" surround the word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <silent> <Leader>s <Plug>SearchNormal
vnoremap <silent> <Leader>s <Plug>SearchVisual
" mapping for _vimrc {{{
" inoremap jk <esc>
" }}}
" test
" open init.vim
nnoremap <leader>,, :silent e ~/.config/nvim/init.vim<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload init.vim
nnoremap <leader>.. :w<CR>:silent source $MYVIMRC<CR>:echo "Vimrc reloaded, 🎉 Have a nice day~"<CR>
"
" plugin dependent mapping================================
" switch input method require im-select
" brew tap daipeihust/tap && brew install im-select
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
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
" completion----
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
" code display----
Plug 'lfv89/vim-interestingwords'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
Plug 'frazrepo/vim-rainbow'
" intergration----
Plug 'makerj/vim-pdf'
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'yianwillis/vimcdoc' "vimcdoc in Chinese
Plug 'MattesGroeger/vim-bookmarks'
Plug 'wellle/targets.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'kqito/vim-easy-replace'
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
Plug 'godlygeek/tabular'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'crusoexia/vim-monokai' "monokai colorschemes
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-browser-search'
" commands----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
" others----
Plug 'vimwiki/vimwiki' | Plug 'michal-h21/vimwiki-sync'
Plug 'michal-h21/vim-zettel'
Plug 'https://github.com/alok/notational-fzf-vim'  " :NV
Plug 'itchyny/vim-cursorword'
Plug 'Yggdroot/indentLine' | Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
Plug 'junegunn/vim-emoji' "Emoji
Plug 'embear/vim-localvimrc'
Plug 'jdhao/better-escape.vim'
" wilder.nvim
" {{{
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" }}}
" ---END of ACTIVE Plug---
" Plug to be installed (currently dono how to use it) {{{
" Plug 'w0rp/ale'
" }}}
" ---Deactivated Plug {{{
" Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'phaazon/hop.nvim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'skywind3000/vim-quickui' "Display a dropdown menubar at top of the screen
" Plug 'aserebryakov/vim-todo-lists'
" Plug 'Shougo/deoplete.nvim'
" Plug 'lyokha/vim-xkbswitch'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'masukomi/vim-markdown-folding'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'https://github.com/preservim/nerdtree', { 'on':  'NERDTreeToggle' } " NerdTree
" }}}
call plug#end()
" }}}
"
" Part.6 ---plugin settings {{{
colorscheme monokai
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:startify_custom_header = startify#center(['Why does the lizard stick his tongue out? The lizard sticks its tongue out because that is the way its listening and looking and tasting its environment. It is its means of appreciating what is in front of it. 🦎'])
set rtp+=/usr/local/opt/fzf
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
    autocmd FileType vimwiki xnoremap <silent><leader>w :call ReplaceSpace()<CR>
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
" rnvimr {{{
nnoremap <silent> <leader>rn :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
tnoremap <silent> <leader>rn <C-\><C-n>:RnvimrToggle<CR>
" let g:rnvimr_shadow_winblend = 70
" let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0 " Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1} " Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70 " let g:rnvimr_bw_enable = 1 highlight link RnvimrNormal CursorLine
highlight link RnvimrNormal CursorLine
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
" }}}
" fzf.vim {{{
"
" fzf settings
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }
" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10split enew' }
let $FZF_DEFAULT_OPTS='--layout=reverse'
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <silent><leader>p :Files %:p:h<CR>
tnoremap <silent><leader>p <Esc>
nnoremap ,fl :Lines<CR>
nnoremap ,fb :BLines
nnoremap ,ff :Files<CR>
nnoremap ,fg :GFiles
nnoremap ,f? :GFiles?
nnoremap ,ft :Tags<cr>
nnoremap ,fa :Ag
nnoremap ,fc :Commits
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
let $FZF_DEFAULT_OPTS="--bind \"ctrl-n:preview-down,ctrl-p:preview-up\""
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

augroup Reload_Vimrc        " Group name.  Always use a unique name!
    autocmd!                " Clear any preexisting autocommands from this group
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END
function! UpdateTimestamp ()
  '[,']s/^This file last updated: \zs.*/\= strftime("%c") /
endfunction

augroup TimeStamping
  autocmd!
  autocmd BufWritePre,FileWritePre,FileAppendPre * :call UpdateTimestamp()
augroup END

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

