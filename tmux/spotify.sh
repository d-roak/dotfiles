#!/bin/bash

metadata=$(dbus-send --reply-timeout=42 --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>/dev/null)

if [ "$?" -eq 0 ] && [ -n "$metadata" ]; then
    state=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player PlaybackStatus)
	if [[ $state == "Playing" ]]; then
		artist=$(echo "$metadata" | grep -PA2 "string\s\"xesam:artist\"" | tail -1 | grep -Po "(?<=\").*(?=\")")
		track=$(echo "$metadata" | grep -PA1 "string\s\"xesam:title\"" | tail -1 | grep -Po "(?<=\").*(?=\")")
		echo "♫ ${artist} - ${track} <"
	fi
fi
