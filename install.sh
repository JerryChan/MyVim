#!/bin/sh

#backup
rm -rf backup
mkdir backup
mv ~/.vim ./backup/vim
mv ~/.vimrc ./backup/vimrc

sudo apt-get install git

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
vim ~/.vim/colors/wombat256mod.vim -c "%s/234/None/g" -c "%s/232/None/g" -c "w" -c "q"

cp ./.vimrc ~/.vimrc

vim -c "BundleInstall" -c "qa"

cd ~/.vim/bundle/neocomplcache/plugin
mv neocomplcache.vim neocomplcache.vim.bak
sed "34,38d" neocomplcache.vim.bak > neocomplcache.vim
