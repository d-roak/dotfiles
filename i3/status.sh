#!/bin/bash

while :
do
	playerctl metadata -f "[ {{artist}}: {{title}} ]"
	sleep 1
done


