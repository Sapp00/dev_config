#!/bin/bash

i3File="/home/$USER/.config/i3/config"

if ! grep -q "i3_startup" "$i3File"; then
  echo "exec ~/.config/i3/i3_startup.sh" >> $i3File
  echo "Set the resolution to 1920x1052 60hz"
else 
  echo "Already patched"
fi
