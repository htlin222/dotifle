# 前言: (大概講一下neovim是啥)
# 安裝neovim
`brew install neovim`
# 建立好路徑
> 或是你也可以直接clone這個repo
```sh
mkdir .config
cd .config
mkdir nvim
cd .nvim
nvim init.vim
```
> 可以考慮直接整包貼上我的設定https://github.com/htlin222/nvim/blob/main/init.vim

> 快速貼上代碼的方法 http://xstarcd.github.io/wiki/vim/vim-copy-paste.html

# 安裝
執行 https://github.com/junegunn/vim-plug 裡面neovim的部分的代碼
在nvim中執行 :PlugInstall

# coc.nvim 的部分: 要先安裝好node
```sh
cd plugged/coc.nvim
sudo npm install -g yarn yarn
install yarn build
: CocInstall coc-python
```
this is a book

this is 




# 接下來要完成的事：
* [如果讓捲我用動效果比較好](如果讓捲我用動效果比較好.md) 
* espanso的設定檔轉成abbr.vim 這樣
* [學習function](學習function)
* [學習autocmd](學習autocmd.md)
* 把Learn Vim the hard way 看完
* [Anki的整合](Anki的整合)
* [小技巧](小技巧.md)
