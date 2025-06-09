#!/bin/zsh

chosen=$(printf "  Power Off\n  Reboot\n  Lock\n  Logout" | rofi -dmenu -i -p "Power")

case "$chosen" in
    "  Power Off") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "  Lock") loginctl lock-session ;;
    "  Logout") hyprctl dispatch exit ;;
esac
