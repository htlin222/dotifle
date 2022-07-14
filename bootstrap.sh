# install xcode
xcode-select --install
# zsh install
# or Use zsh as the default shell on your Mac
sudo apt install zsh
# 檢查並安裝 Oh My Zsh。
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# edit zshrc: ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.zshrc
# 檢查並安裝 Homebrew。
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget
# 更新並安裝 brew packages(binaries, fonts, apps)。
sh ~/.dotfile/Brewfile
# vscode, iterm, edge, r, rstudio
brew install cask
brew install --cask r
brew install --cask rstudio
brew install --cask appcleaner
brew install --cask keka
brew install --cask nvalt
brew install --cask spotify
brew install --cask steam
brew install --cask telegram-desktop
brew install --cask messenger
brew install --cask customshortcuts
brew install --cask teamviewer
brew install --cask zoom
brew install onedrive
brew install --cask resilio-sync
brew install --cask obsidian
brew install --cask notion
brew install --cask pdf-expert
brew install --cask anki
brew install --cask tor-browser
brew install --cask streamlabs-obs
brew install --cask obs
brew install --cask keycastr
brew install --cask karabiner-elements
brew install --cask send-to-kindle
brew install --cask kindle
brew install docker
brew install --cask gitkraken
brew install --cask dropbox
brew install --cask iina
brew install --cask microsoft-edge
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask devonthink
brew install --cask calibre
brew install --cask espanso
brew install --cask discord
brew install --cask blender
brew install --cask macdown
brew install --cask simplenote

# 檢查並連結 dotfiles(.zshrc, .vimrc, .gitconfig,.gitignore, ...)。
# rm the default config files
rm -rf ~/.config
# create link
ln -s ~/.dotfile/.config ~/.config
ln -s ~/.dotfile/.zshrc ~/.zshrc
ln -s ~/.dotfile/.oh-my-zshrc ~/.oh-my-zshrc
ln -s ~/.dotfile/pyscripts/ ~/pyscripts/
# 設置 Mac OS X 的 defaults settings。
# 使用 Mackup 進行備份回復：
mackup restore
