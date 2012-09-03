#!/bin/sh

#backup
rm -rf backup
mkdir backup
mv ~/.vim ./backup/vim
mv ~/.vimrc ./backup/vimrc

sudo apt-get install git
sudo apt-get install clang

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cp ./.vimrc ~/.vimrc

vim -c "BundleInstall" -c "qa"

rm ~/.vimrc
sed "31acolorscheme molokai" .vimrc > ~/.vimrc

sudo chown -R $USER ~/.neocon
sudo chgrp -R $USER ~/.neocon

wget -O conque_2.3.vmb http://conque.googlecode.com/files/conque_2.3.vmb
vim conque_2.3.vmb -c "so %" -c "qa"
rm conque_2.3.vmb

cd ~/.vim/bundle/neocomplcache/plugin
mv neocomplcache.vim neocomplcache.vim.bak
sed "34,38d" neocomplcache.vim.bak > neocomplcache.vim

