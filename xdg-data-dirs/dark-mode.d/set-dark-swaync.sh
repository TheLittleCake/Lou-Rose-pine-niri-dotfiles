#!/bin/bash

cp /home/<user>/.config/swaync/style-dark.css /home/<user>/.config/swaync/style.css
sudo -u <user> NIRI_SOCKET=$(ls /run/user/1000/niri.wayland-1.*) niri msg action spawn -- swaync-client -rs
