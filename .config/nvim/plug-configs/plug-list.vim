
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
Plug 'tpope/vim-fugitive' " git support
Plug 'kqito/vim-easy-replace'
Plug 'gcmt/wildfire.vim'         " in Visual mode, type k' to select all text in '', or type k) k] k} kp
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
Plug 'wfxr/minimap.vim'
" commands----
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'https://github.com/alok/notational-fzf-vim'  " :NV
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
" Bookmarks
Plug 'kshenoy/vim-signature'
" others----
Plug 'vimwiki/vimwiki' | Plug 'michal-h21/vimwiki-sync'
Plug 'michal-h21/vim-zettel'
Plug 'itchyny/vim-cursorword'
Plug 'Yggdroot/indentLine' | Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user' | Plug 'glts/vim-textobj-comment'
Plug 'junegunn/vim-emoji' "Emoji
Plug 'embear/vim-localvimrc'
Plug 'jdhao/better-escape.vim'
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
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
call plug#end()
" Deactivated Plug {{{
" Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
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
" not yet installed {{{
"Plug 'liuchengxu/vim-which-key'
"" Float Term
"Plug 'voldikss/vim-floaterm'
"Plug 'wellle/tmux-complete.vim'
"" Other visual enhancement
"Plug 'itchyny/vim-cursorword'
"" Git
"Plug 'cohama/agit.vim'
"Plug 'kdheepak/lazygit.nvim'
"" Terraform
"Plug 'hashivim/vim-terraform'
"Plug 'elzr/vim-json'
"Plug 'neoclide/jsonc.vim'
"Plug 'othree/html5.vim'
"Plug 'alvan/vim-closetag'
"Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"" Asyncrun
"Plug 'skywind3000/asyncrun.vim'
"" Go
"Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
"" Bookmarks
"Plug 'kshenoy/vim-signature'
"" Clipboard
"Plug 'kana/vim-fakeclip'
"" Editor Enhancement
"Plug 'mg979/vim-visual-multi'
"Plug 'junegunn/vim-after-object' " da= to delete what's after =
"Plug 'svermeulen/vim-subversive'
"Plug 'theniceboy/argtextobj.vim'
"Plug 'rhysd/clever-f.vim'
"Plug 'AndrewRadev/splitjoin.vim'
""Plug 'mj-hd/vim-picomap', { 'do': 'bash install.sh' }
"" Other visual enhancement
"Plug 'luochen1990/rainbow'
"Plug 'mg979/vim-xtabline'
"Plug 'ryanoasis/vim-devicons'
" }}}
" Plug to be installed (currently dono how to use it) {{{
" Plug 'w0rp/ale'
" }}}
