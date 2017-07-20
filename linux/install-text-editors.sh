#!/bin/sh

set -e

# install vim
sudo apt-get install libsynctex-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install zathura -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/sources_non_forked/vimtek
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/sources_non_forked/vim-pencil
git clone https://github.com/joshdick/onedark.vim.git ~/.vim_runtime/sources_non_forked/onedark.vim
# install Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt update
sudo apt-get install sublime-text-installer
rm -rf ~/.config/sublime-text-3/Packages/User/
ln -t ~/.config/sublime-text-3/Packages/ -s ~/Dropbox/collections/dev/sublime-text/User
