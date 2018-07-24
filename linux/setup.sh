#!/bin/sh

set -e

# update everything
sudo apt update
sudo apt upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# install Docker
curl -sSL https://get.docker.com/ | sh

# install developer stuff
sudo apt-get install xclip -y
sudo apt-get install git -y
sudo apt-get install filezilla -y
sudo apt-get install gnuplot -y
sudo apt-get install curl -y
sudo apt-get install npm -y
sudo apt-get install libtiff5-dev -y
sudo apt-get install libfftw3-dev -y
sudo apt-get install libcupti-dev -y
sudo apt-get install tmux -y
sudo apt-get install global -y
sudo apt-get install gdebi-core -y

# install media software
sudo apt-get install vlc -y
sudo apt-get install exfat-utils exfat-fuse -y
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# install iptables
sudo apt-get install iptables-persistent -y

# make available the latest Nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update

# install ssh server
sudo apt-get install openssh-server -y
# systemctl status ssh
# sudo service ssh restart
# config file located at /etc/ssh/sshd_config

# install utilities
sudo apt-get install htop -y
sudo apt-get install unrar -y
sudo apt-get install tree -y
sudo apt-get install network-manager-vpnc network-manager-vpnc-gnome network-manager-openconnect-gnome -y

# install oh my zsh
sudo apt-get install zsh -y
sudo apt-get install git-core
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install z
curl -o ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
# chsh -s `which zsh`
# copy .zshrc to ~/
cp ./.zshrc ~/
# copy .zshenv to ~/
cp ./.zshenv ~/

# install vim
sudo apt-get install vim vim-gnome -y
sudo apt-get install libsynctex-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install ack-grep -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime

# install vim plugins
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one


# install paper theme for Gnome
sudo apt-get install gnome-tweak-tool -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt update
sudo apt-get install paper-icon-theme -y
sudo apt-get install paper-gtk-theme -y
sudo apt-get install paper-cursor-theme -y

# install fonts
sudo apt-get install fonts-inconsolata -y
sudo apt-get install fonts-hack-ttf -y
sudo apt-get install fonts-powerline
sudo fc-cache -fv

# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# turn terminal cursor blinking off
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

# swap escape and caps lock keys
sudo apt-get install dconf-tools -y
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# install nodejs and npm
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install npm cli tools
npm install --global emoj
npm install --global fast-cli
npm install --global pure-prompt

### POST SETUP ###
# install CUDA toolkit once choosing the latest Nvidia driver
# sudo apt-get install cuda
# to fix any screen tearing with Ubuntu 16.04 and Nvidia GTX 1070
# nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
# then go into Nvidia X Server, click on X Server Display Configuration, and
# click Save to X Configuration File
# download cuDNN 5.1 (must login to Nvidia first): https://developer.nvidia.com/cudnn
# run the following commands:
# sudo cp -P include/cudnn.h /usr/include
# sudo cp -P lib64/libcudnn* /usr/lib/x86_64-linux-gnu/
# sudo chmod a+r /usr/lib/x86_64-linux-gnu/libcudnn*
# sudo cp -P include/cudnn.h /usr/local/cuda-8.0/include
# sudo cp -rP lib64 /usr/local/cuda-8.0/lib64
# create .theanorc file in home directory with contents:
# [global]
# device = cuda
# floatX = float32

# set up iptables for remote Jupyter Notebook
# sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 8888 -j ACCEPT
# sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 443 -j ACCEPT
# sudo netfilter-persistent save
# sudo netfilter-persistent reload
# saved rules are stored below
# sudo vim /etc/iptables/rules.v4

# manually mount Plex drive
# sudo parted -l
# sudo mkdir /media/Media
# sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media

# configure keyboard shortcuts for media:
# settings --> Keyboard --> Sound and Media
# disable "Play (or play/pause)", "Previous Track", and "Next Track"