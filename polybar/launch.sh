#!/usr/bin/env bash

if ! pgrep -u $UID -x polybar; then
  if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      MONITOR=$m polybar top &
    done
  else
    polybar top &
  fi
else
  pkill -USR1 polybar
fi

echo "Bar launched..."
