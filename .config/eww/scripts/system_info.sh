#!/bin/bash

get_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk "{print int(\$2)}")
    echo "$cpu_usage"
}

get_memory() {
    memory_usage=$(free -m | awk "/^Mem:/ {print int(\$3/\$2 * 100)}")
    echo "$memory_usage"
}

get_temp() {
    temp=$(sensors | grep "CPU" | awk "{print int(\$2)}" | head -n 1)
    echo "${temp:-0}"
}

case "$1" in
    cpu)
        get_cpu
        ;;
    memory)
        get_memory
        ;;
    temp)
        get_temp
        ;;
    *)
        echo "Usage: $0 {cpu|memory|temp}"
        exit 1
        ;;
esac
