#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt-get install -y i3blocks i3status i3-wm compton flameshot lightdm
sudo systemctl enable lightdm.service


mkdir -p .config
cp -r .config/* ~/.config/
