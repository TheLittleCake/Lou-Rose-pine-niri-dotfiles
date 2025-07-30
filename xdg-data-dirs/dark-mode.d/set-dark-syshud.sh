#!/bin/bash

cp /home/<user>/.config/sys64/hud/style-dark.css /home/<user>/.config/sys64/hud/style.css
killall syshud
sudo -u <user> NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*) niri msg action spawn -- /home/<user>/.config/niri/scripts/syshud.sh
