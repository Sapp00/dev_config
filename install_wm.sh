#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get install -y i3blocks i3status i3-wm compton flameshot lightdm kitty rofi
sudo systemctl enable lightdm.service
sudo apt-get install -y xclip # for nvim system clipboard


mkdir -p .config
cp -r .config/* ~/.config/
