" Basic Key Mappings
" map leader to spacebar
let mapleader=' '
nnoremap ; :
nnoremap : ;
" is a source for $HOME/.config/nvim/init.vim (press gf to go to the init.vim)
nnoremap <down> <C-w><C-j>
nnoremap <up> <C-w><C-k>
nnoremap <right> <C-w><C-l>
nnoremap <left> <C-w><C-h>
" Use <space> + hjkl to move focus on split window
" map <LEADER>h <C-w>h
" map <LEADER>j <C-w>j
" map <LEADER>k <C-w>k
" map <LEADER>l <C-w>l
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
" paste under the current line
nnoremap <c-p> :pu<CR>
" j and k navigate visual lines rather than logical ones
nnoremap j gjzz
nnoremap k gkzz
" H remap to the begin of the line, L to the end of line
nnoremap H ^
nnoremap L $
" remap enter in normal mode to break a line
nnoremap <CR> i<CR><Esc>
" center the page before entering the insert mode
nnoremap i zzi
nnoremap a zza
nnoremap A zzA
nnoremap o zzo
nnoremap O zzO
" clear the highlight
nnoremap <silent>? :set hls!<CR>
" insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap ;v <Esc>viw
inoremap <C-,> <esc>/<++><Enter>"_c4l
" delet to the EOL in insertmode
" inoremap <C-d> <C-O>D
" jump out of the parenthesis
inoremap <C-e> <C-o>a
" save
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
" " to adjust the window size
" nnoremap <leader>ll :vertical resize +10<CR>
" leave terminal mode
tnoremap <Esc><Esc> <C-\><C-n>
" navigate to other windows by arrow key
tnoremap <down> <C-\><C-n><C-w><C-j>
tnoremap <up> <C-\><C-n><C-w><C-k>
tnoremap <right> <C-\><C-n><C-w><C-l>
tnoremap <left> <C-\><C-n><C-w><C-h>
" split vertical
nnoremap <leader>; <C-W>s
" split horizontal
nnoremap <leader>` <C-W>v
" open newtrw at the
nnoremap <silent><leader>t :Lexplore %:h<cr>
" surround the word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <silent> <Leader>s <Plug>SearchNormal
vnoremap <silent> <Leader>s <Plug>SearchVisual
" suspend the neovim
nnoremap <silent>zo <C-z>
" open init.vim
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>
" reload init.vim
nnoremap <silent><leader><leader>. :w<CR>:silent! source $MYVIMRC<CR>:echo "Vimrc reloaded, 🎉 Have a nice day~"<CR>
" Move lines around
nnoremap <silent><S-Up> :m-2<CR>
nnoremap <silent><S-Down> :m+<CR>
inoremap <silent><S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
" Increment && Decrement number
nnoremap + <C-a>
nnoremap _ <C-x>
" " Use <space> =- to change tab
nnoremap tt :tabe<CR>
nnoremap <LEADER>- :-tabnext<CR>
nnoremap <LEADER>= :tabnext<CR>
" TAB in general mode will move to text buffer
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
nnoremap gf <C-W>gf
nnoremap <leader>cf :call CreateFile(expand("<cfile>"))<CR>
function! CreateFile(tfilename)
    " complete filepath from the file where this is called
    let newfilepath=expand('%:p:h') .'/'. expand(a:tfilename)

    if filereadable(newfilepath)
       echo "File already exists"
       :norm gf
    else
        :execute "!touch ". expand(newfilepath)
        echom "File created: ". expand(newfilepath)
        :norm gf
    endif
endfunction
" Fold
nnoremap zr zRzz
nnoremap zm zMzz
nnoremap za zazz
" you can map zo, zc
" Use > or < to indent or unindent in visual line mode
vnoremap <S-TAB> <gv
vnoremap <TAB> >gv
" Use <TAB> to indent or unindent in normal mode
nnoremap <TAB> >>
nnoremap <S-TAB> <<
" Use <space> + arrow key to resize windows
nnoremap <LEADER><up> :res+1<CR>
nnoremap <LEADER><down> :res-1<CR>
nnoremap <LEADER><left> :vertical resize-5<CR>
nnoremap <LEADER><right> :vertical resize+5<CR>
" Opening a terminal window
nnoremap <LEADER>, :tabe<CR>:term<CR>i
" noremap <LEADER>, :set splitbelow<CR>:split<CR>:res +5<CR>:term<CR>i
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

nnoremap <silent><leader>q :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
tnoremap <silent><leader>q <C-\><C-n>:RnvimrToggle<CR>
" tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
" === Vista
nnoremap <silent><leader><leader>v :w<CR>:Vista!!<CR>
" === Tagbar
nnoremap <silent><leader><leader>' :TagbarToggle<CR>
" === Undotree
nnoremap <silent><leader><leader>u :UndotreeToggle<CR>
" === Goya
nnoremap <silent><leader>gy :Goyo<CR>
" === Tabular
vnoremap tb :Tabularize /
" === Minimap
nnoremap <silent><LEADER>m :MinimapToggle<CR>
" === Lazygit
nnoremap <leader><leader>lz :tabe<CR>:term lazygit<CR>
" === wildfire
nnoremap <leader><CR> <Plug>(wildfire-fuel)
" === startify
nnoremap <leader>y :vs<CR>:Startify<CR>
" === Floaterm binding
" nnoremap <silent> <LEADER>T :FloatermToggle<CR>
" tnoremap <silent> X <C-\><C-n>:FloatermToggle<CR>
" nnoremap <silent> <C-x> :FloatermToggle<CR>
" tnoremap <silent> <C-x> <C-\><C-n>:FloatermToggle<CR>
" === Floaterm
" Terminal mode binding
" tnoremap <silent> Q <C-\><C-N>:q<CR>
" === Figlet
" map fg :r !figlet
" test
