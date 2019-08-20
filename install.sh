#!/bin/sh

#pacman -S fish neovim tmux sxhkd mpv lightdm conky screenfetch

#yaourt
#git clone https://aur.archlinux.org/yaourt.git
#cd yaourt/
#makepkg -si
#cd ..
#rm -rd yaourt/

#yaourt spotify lf

#suckless


# link config files
for file in config/*; do
   filename=$(echo $file | sed -e 's/config\///')
   mv ~/.config/$filename ~/.config/$filename.$RANDOM
   echo $file
   ln -s $PWD/$file ~/.config/
done

#mv ~/.bashrc ~/.bashrc.$RANDOM
#mv ~/.zshrc ~/.zshrc.$RANDOM
#mv ~/.tmux.conf ~/.tmux.conf.$RANDOM
#mv ~/.vim ~/.vim.$RANDOM
#mv ~/.vimrc ~/.vimrc.$RANDOM

#ln -s bashrc ~/.bashrc
#ln -s zshrc ~/.zshrc
#ln -s tmux.conf ~/.tmux.conf
#ln -s vim ~/.vim
#ln -s vimrc ~/.vimrc
