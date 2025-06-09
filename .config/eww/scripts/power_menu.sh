#!/bin/bash

LOCKSCREEN_CMD="swaylock -f"
LOGOUT_CMD="hyprctl dispatch exit"
SHUTDOWN_CMD="systemctl poweroff"
REBOOT_CMD="systemctl reboot"
SUSPEND_CMD="systemctl suspend"

case "$1" in
    lock)
        $LOCKSCREEN_CMD
        ;;
    logout)
        $LOGOUT_CMD
        ;;
    shutdown)
        $SHUTDOWN_CMD
        ;;
    reboot)
        $REBOOT_CMD
        ;;
    suspend)
        $SUSPEND_CMD
        ;;
    *)
        echo "Usage: $0 {lock|logout|shutdown|reboot|suspend}"
        exit 1
        ;;
esac
