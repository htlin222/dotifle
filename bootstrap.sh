# install the brew 
sh ~/.dotfile/Brewfile
# rm the default config files
rm -rf ~/.config
# create link
ln -s ~/.dotfile/.config ~/.config
ln -s ~/.dotfile/.zshrc ~/.zshrc
ln -s ~/.dotfile/.oh-my-zshrc ~/.oh-my-zshrc
ln -s ~/.dotfile/pyscripts/ ~/pyscripts/
