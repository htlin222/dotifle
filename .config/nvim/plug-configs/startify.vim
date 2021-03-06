" let g:startify_custom_header = [
"       \ '    _   _       _              ____ _                 _  ',
"       \ '   | \ | |_   _(_)_ __ ___    / ___| | ___  _   _  __| | ',
"       \ '   |  \| \ \ / / | `_ ` _ \  | |   | |/ _ \| | | |/ _` | ',
"       \ '   | |\  |\ V /| | | | | | | | |___| | (_) | |_| | (_| | ',
"       \ '   |_| \_| \_/ |_|_| |_| |_|  \____|_|\___/ \__,_|\__,_| ',
"       \
"       \]


let g:startify_custom_header = startify#center(['Why does the lizard stick his tongue out? The lizard sticks its tongue out because that is the way its listening and looking and tasting its environment. It is its means of appreciating what is in front of it. 🦎'])

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                   },
          \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 's': '~/Documents/Medical/index.md' }
            \ ]

let g:startify_enable_special = 0
