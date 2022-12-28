#!/bin/bash
wal -i $1
wal-discord ; beautifuldiscord --css ~/.cache/wal-discord/style.css
cd ~/suckless/st ; sudo make clean install ; cd -
razer-cli -e multicolor,xpalette
spicetify apply
colors=`cat $HOME/.cache/wal/colors.Xresources | grep "^*color[0-8]:" | tr -d "*:" | sed -r 's/  (#.*)/\=\"\1\",/g'`
cat ~/.config/conky/conkyrc.template | awk -v srch="COLORS" -v repl="$colors" '{ sub(srch,repl,$0); print $0 }' > ~/.conkyrc
$HOME/.scripts/alacritty-colors.sh
