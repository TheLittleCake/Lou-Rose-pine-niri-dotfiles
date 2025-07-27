#!/bin/bash

SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Hard reboot\n7 - Shutdown" | fuzzel --config=$HOME/.config/fuzzel/fuzzel-settings.ini --dmenu -l 7 -p "Power Menu: ")"

case $SELECTION in
	*"Lock")
		hyprlock;;
	*"Suspend")
		hyprlock && systemctl suspend;;
	*"Log out")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	*"Reboot to UEFI")
		systemctl reboot --firmware-setup;;
	*"Hard reboot")
		pkexec "echo b > /proc/sysrq-trigger";;
	*"Shutdown")
		systemctl -i poweroff;;
esac
