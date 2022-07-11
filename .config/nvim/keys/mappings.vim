" Basic Key Mappings
" map leader to spacebar
let mapleader=' '
" is a source for $HOME/.config/nvim/init.vim
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
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
" save
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload init.vim
nnoremap <leader><leader>. :w<CR>:silent source $MYVIMRC<CR>:echo "Vimrc reloaded, 🎉 Have a nice day~"<CR>
"
" ==================== from other's =======
" Move lines around
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Increment && Decrement
nnoremap + <C-a>
nnoremap _ <C-x>

" Figlet
" map fg :r !figlet

" Use <space> =- to change tab
nnoremap tt :tabe<CR>
nnoremap <LEADER>- :-tabnext<CR>
nnoremap <LEADER>= :tabnext<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Use > or < to indent or unindent in visual line mode
vnoremap <S-TAB> <gv
vnoremap <TAB> >gv
" Use <TAB> to indent or unindent in normal mode
" nnoremap <TAB> >>
" nnoremap <S-TAB> <<
" Use TAB to indent and Shift-TAB to undent in insert mode
inoremap <TAB> <C-t>
inoremap <S-TAB> <C-d>


" change split direction
" map sh <C-w>t<C-w>H
" map sv <C-w>t<C-w>K

" Use <space> + hjkl to move focus on split window
" map <LEADER>h <C-w>h
" map <LEADER>j <C-w>j
" map <LEADER>k <C-w>k
" map <LEADER>l <C-w>l

" Use <space> + arrow key to resize windows
nnoremap <LEADER><up> :res+5<CR>
nnoremap <LEADER><down> :res-5<CR>
nnoremap <LEADER><left> :vertical resize-5<CR>
nnoremap <LEADER><right> :vertical resize+5<CR>

"Commenter
" autocmd VimEnter * noremap <LEADER>/ :call NERDComment(0,"toggle")<CR>


" ===
" === Useful Tools
" ===

" Opening a terminal window
" noremap <LEADER>, :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>
nnoremap <LEADER>, :tabe<CR>:term<CR>

" Spelling Check with <space>sc
nnoremap <LEADER>sc :set spell!<CR>

" Find and Replace
vnoremap \s :s//g<left><left>
nnoremap \s :%s//g<left><left>

" Wrap
noremap <LEADER>sw :set wrap<CR>

" Clipboard
" nnoremap <C-p> "+gp
" nnoremap <C-c> "+yy
" vnoremap <C-c> "+y

" ===========================
" === Plugins Key Binding ===
" ===========================

" switch input method require im-select
" brew tap daipeihust/tap && brew install im-select
"
nnoremap <silent> <leader>rn :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
tnoremap <silent> <leader>rn <C-\><C-n>:RnvimrToggle<CR>
" toggle Vista
nnoremap <leader><leader>v :w<CR>:Vista!!<CR>
" toggle Tagbar
nnoremap <leader><leader>' :TagbarToggle<CR>
" toggle Undotree
nnoremap <leader><leader>u :UndotreeToggle<CR>
" toggle Goya
nnoremap <leader>gy :Goyo<CR>
" === Tabular
vnoremap tb :Tabularize /

" === Floaterm
" Terminal mode binding
" tnoremap <silent> Q <C-\><C-N>:q<CR>

" === Minimap
nnoremap <silent> <LEADER>m :MinimapToggle<CR>
" === Lazygit
noremap <leader><leader>lz :tabe<CR>:term lazygit<CR>

" " Floaterm binding
" nnoremap <silent> <LEADER>T :FloatermToggle<CR>
" tnoremap <silent> X <C-\><C-n>:FloatermToggle<CR>
" nnoremap <silent> <C-x> :FloatermToggle<CR>
" tnoremap <silent> <C-x> <C-\><C-n>:FloatermToggle<CR>
