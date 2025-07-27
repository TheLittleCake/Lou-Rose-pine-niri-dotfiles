#!/bin/bash

cp /home/lou/.config/swaync/style-dark.css /home/lou/.config/swaync/style.css
NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*)
sudo -u lou NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*) niri msg action spawn -- swaync-client -rs
