let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOPen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOPenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapMapOpenInTab = "t"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDIr = "n"
let NERDTreeMapChangeRoot = "y"


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
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
