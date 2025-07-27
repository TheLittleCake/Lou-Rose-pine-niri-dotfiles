#!/bin/bash
rm /home/lou/Images/Wallpapers
ln -s /home/lou/Images/Wallpapers-light /home/lou/Images/Wallpapers
NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*)
sudo -u lou NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*) niri msg action spawn -- /home/lou/.config/niri/scripts/rotate-wallpaper-once.sh
