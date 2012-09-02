#!/bin/sh

#backup
rm -rf backup
mkdir backup
mv ~/.vim ./backup/vim
mv ~/.vimrc ./backup/vimrc

sudo apt-get install git
sudo apt-get install clang

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
vim ~/.vim/colors/wombat256mod.vim -c "%s/234/None/g" -c "%s/232/None/g" -c "w" -c "q"

cp ./.vimrc ~/.vimrc

vim -c "BundleInstall" -c "qa"

sudo chown -R $USER ~/.neocon
sudo chgrp -R $USER ~/.neocon

wget -O conque_2.3.vmb http://conque.googlecode.com/files/conque_2.3.vmb
vim conque_2.3.vmb -c "so %" -c "qa"
rm conque_2.3.vmb

cd ~/.vim/bundle/neocomplcache/plugin
mv neocomplcache.vim neocomplcache.vim.bak
sed "34,38d" neocomplcache.vim.bak > neocomplcache.vim

