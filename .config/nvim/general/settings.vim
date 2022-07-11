set nocompatible
filetype off
exec "nohlsearch"

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
set laststatus=2
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
"
" set autochdir
" set completeopt=longest,noinsert,menuone,noselect,preview
" set exrc
" set guicursor=      "  set block cursor for insert mode
" set hlsearch      "  Enables highlight search
" set inccommand=split
" set indentexpr=
" set list
" set listchars=tab:\|\ ,trail:▫                            "  tab display format
" set nowritebackup noswapfile nobackup
" set shiftround shiftwidth=4
" set softtabstop=4
" set splitbelow splitright
" set scrolloff=8                                           "  add extra lines for scrolling
" set secure
" set showtabline     "  always show tabline
" set signcolumn=yes  "  always show the signcolumn, or it would shift the text each time
" set tabstop=2       "  insert 2 spaces for a tab
" set timeout timeoutlen=500 ttimeoutlen=100
" set ttyfast                                               "  Make scrolling faster
" set tw=0
" set undofile
" set undoir=~/.config/nvim/undodir
" set updatetime=100                                        " Faster completion
" set viewoptions=cursor,slash,folds,unix
" set virtualedit=block

filetype plugin indent on
syntax enable

" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to the previous edit position

" === Functional Behaviors
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC | echo "Vimrc reloaded, 🎉 Have a nice day~"
augroup END " }
