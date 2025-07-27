#!/bin/bash

cp /home/lou/.config/sys64/hud/style-dark.css /home/lou/.config/sys64/hud/style.css
killall syshud
NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*)
sudo -u lou NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*) niri msg action spawn -- /home/lou/.config/niri/scripts/syshud.sh
