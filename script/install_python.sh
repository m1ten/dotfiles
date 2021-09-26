#!/usr/bin/env sh

if ! command -v python3; then
	if [ -x "$(command -v apt)" ]; then
    	sudo apt install python3
  	elif [ -x "$(command -v dnf)" ]; then
    	sudo dnf install python3.9
  	elif [ -x "$(command -v pacman)" ]; then
    	sudo pacman -S python
  	fi 
fi