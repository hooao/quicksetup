#!/bin/sh

VIMRC="https://raw.githubusercontent.com/hooao/quicksetup/master/vimrc"
VUNDLEVIM="https://github.com/VundleVim/Vundle.vim.git"
INPUTRC="https://raw.githubusercontent.com/hooao/quicksetup/master/inputrc"
TMUXCONFIG="https://raw.githubusercontent.com/hooao/quicksetup/master/tmux.conf"

git clone --depth=1 $VUNDLEVIM ~/.vim/Vundle.vim

wget -O ~/.vimrc $VIMRC
wget -O ~/.inputrc $INPUTRC
wget -O ~/.tmux.conf $TMUXCONFIG
echo "done!"
