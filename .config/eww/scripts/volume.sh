#!/bin/bash

get_volume() {
    volume=$(pamixer --get-volume 2>/dev/null || echo "0")
    muted=$(pamixer --get-mute 2>/dev/null || echo "false")
    if [ "$muted" = "true" ]; then
        echo "0"
    else
        echo "$volume"
    fi
}

set_volume() {
    pamixer --set-volume "$1"
}

toggle_mute() {
    pamixer -t
}

case "$1" in
    get)
        get_volume
        ;;
    set)
        set_volume "$2"
        ;;
    toggle)
        toggle_mute
        ;;
    *)
        echo "Usage: $0 {get|set|toggle}"
        exit 1
        ;;
esac
