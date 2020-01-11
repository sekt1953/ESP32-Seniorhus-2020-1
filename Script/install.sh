#!/bin/bash

# opret directory til dine bin filer
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/icons
PATH="$PATH:$HOME/bin"

# giv default bruger adgang til serial port
sudo usermod -a -G dialout $USER  

# opdater din linux
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y

# installer nogle hjælpe programmer
sudo apt install -y git xclip pinta geany* vlc putty python3-distutils

# opret mappe til projecter
mkdir -p ~/Dokumenter/GitHub/
mkdir -p ~/Dokumenter/FreeCad/
mkdir -p ~/Dokumenter/ESP32/