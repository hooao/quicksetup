#!/bin/sh

VIMRC="https://raw.githubusercontent.com/hooao/quicksetup/master/vimrc"
VUNDLEVIM="https://github.com/VundleVim/Vundle.vim.git"

git clone --depth=1 $VUNDLEVIM ~/.vim/Vundle.vim

wget -O ~/.vimrc $VIMRC
echo "done!"
