#!/bin/bash

apt-get update
apt-get install -y rxvt-unicode zsh tmux tmuxinator vim neovim

mv ~/.bashrc ~/.bashrc.$RANDOM
mv ~/.zshrc ~/.zshrc.$RANDOM
mv ~/.tmux.conf ~/.tmux.conf.$RANDOM
mv ~/.vim ~/.vim.$RANDOM
mv ~/.vimrc ~/.vimrc.$RANDOM

ln -s bashrc ~/.bashrc
ln -s zshrc ~/.zshrc
ln -s tmux.conf ~/.tmux.conf
ln -s vim ~/.vim
ln -s vimrc ~/.vimrc
