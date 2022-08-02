# This is my dotfile
## Install brew first:
[macOS 缺少套件的管理工具 — Homebrew](https://brew.sh/index_zh-tw)
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew install wget
# Install GUI for git: gitkraken
$brew install --cask gitkraken
# Install iTerm 
$brew install --cask iterm2
```
## clone this repo by:
```shell
cd ~
git clone https://github.com/htlin222/dotifle.git
```
or clone the repo via gitkraken

## delete the defaut config and link the repo files
```
rm -rf ~/.config
ln -s ~/.dotfile/.config ~/.config
rm .zshrc
ln -s ~/.dotfile/.zshrc ~/.zshrc
# add the file you need
```
## Install the necessary package from homebrew
### backup the brew package from old machine
```shell
brew bundle dump --describe --force 
```
### install the package via the mentioned Brewfile
```shell
brew bundle --file="~/.dotifle/Brewfile"
brew install --cask stats
```
## set up for oh-my-zsh
```shell

```
## install node and python 
> since my previous machine's node and python was download via GUI
### option1: install via GUI
[下載 | Node.js](https://nodejs.org/zh-tw/download/)
[Anaconda | Anaconda Distribution](https://www.anaconda.com/products/distribution)
### option2: install via brew
> not recommended since my vimrc's path was different
```shell
brew install node
brew install python
pyenv install 3.x.x # the latest version
pyenv virtualenv 3.7.1 neovim3
pyenv activate neovim3
pip install neovim
pyenv which python     # 記下 python3 的 path
# in vim vimrc, let g:python3_host_prog = '/Users/username/.pyenv/versions/neovim3/bin/python'
```
## vim
### install the package 
```shell 
pip3 install neovim
pip3 install --upgrade pynvim
npm install --global yarn
brew install code-minimap
```
See: [how to set up vim](vim_how_to.md)
## mac OS setup
```shell
# 關閉“你確定要開啟這個應用程式?”詢問視窗
defaults write com.apple.LaunchServices LSQuarantine -bool false
# 開啟全部視窗組件支援鍵盤控制
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# 加快鍵盤輸入
defaults write NSGlobalDomain KeyRepeat -int 0
# 移除視窗截圖的影子
defaults write com.apple.finder NewWindowTarget -string "PfLo"
# Finder 標題列顯示完整路徑
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# 預設搜尋列的結果為當前目錄下
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# 關閉改變副檔名的警告提示
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# 避免在 network volumes 底下建立 .DS_Store 檔案
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# 關閉清空垃圾桶的警告提示
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# 加快 Mission Control 的動畫速度
defaults write com.apple.dock expose-animation-duration -float 0.1
```
## other must have app but need GUI
* [Mage Software > Display Rotation Menu](http://www.magesw.com/displayrotation/)
* [Magnet – Window manager for Mac](https://magnet.crowdcafe.com/)
* [Keyboard Maestro 10.1.1: Work Faster with Macros for macOS](https://www.keyboardmaestro.com/main/)
* [Noodlesoft – Noodlesoft – Simply Useful Software](https://www.noodlesoft.com/)
