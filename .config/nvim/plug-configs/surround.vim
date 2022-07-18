autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('b')} = "**\r**"
autocmd FileType vimwiki let b:surround_{char2nr('w')} = "[[\r]]"
