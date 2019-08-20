#!/bin/sh

cat ~/dotfiles/scripts/emoji.data | dmenu -i -l 20 -fn Monospace-18 | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
