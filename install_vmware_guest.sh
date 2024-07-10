#!/bin/bash

sudo apt install -y open-vm-tools

i3File="/home/$USER/.config/i3/config"

if ! grep -q "vmware" "$i3File"; then
  echo "exec --no-startup-id vmware-user-suid-wrapper" >> $i3File
  echo "Patched"
else 
  echo "Already patched"
fi
