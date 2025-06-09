#!/bin/bash

get_network() {
    wireless_connection=$(iwgetid -r)
    wired_connection=$(cat /sys/class/net/e*/operstate 2>/dev/null)
    
    if [ -n "$wireless_connection" ]; then
        signal_strength=$(iwconfig wlan0 | grep "Link Quality" | awk "{print int(\$2*100/70)}" | cut -d"=" -f2)
        echo "wifi ${wireless_connection} ${signal_strength}"
    elif [ "$wired_connection" = "up" ]; then
        echo "wired"
    else
        echo "disconnected"
    fi
}

toggle_wifi() {
    if rfkill list wifi | grep -q "blocked: yes"; then
        rfkill unblock wifi
    else
        rfkill block wifi
    fi
}

case "$1" in
    get)
        get_network
        ;;
    toggle)
        toggle_wifi
        ;;
    *)
        echo "Usage: $0 {get|toggle}"
        exit 1
        ;;
esac
