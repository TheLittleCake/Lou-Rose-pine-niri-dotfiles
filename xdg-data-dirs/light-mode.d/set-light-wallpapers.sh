#!/bin/bash
rm /home/<user>/Images/Wallpapers
ln -s /home/<user>/Images/Wallpapers-light /home/<user>/Images/Wallpapers
NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*)
sudo -u <user> NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*) niri msg action spawn -- /home/<user>/.config/niri/scripts/rotate-wallpaper-once.sh
