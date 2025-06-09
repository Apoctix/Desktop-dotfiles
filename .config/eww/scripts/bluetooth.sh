#!/bin/bash

get_bluetooth() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        connected_devices=$(bluetoothctl devices Connected | wc -l)
        if [ "$connected_devices" -gt 0 ]; then
            echo "connected $connected_devices"
        else
            echo "on"
        fi
    else
        echo "off"
    fi
}

toggle_bluetooth() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
}

case "$1" in
    get)
        get_bluetooth
        ;;
    toggle)
        toggle_bluetooth
        ;;
    *)
        echo "Usage: $0 {get|toggle}"
        exit 1
        ;;
esac
