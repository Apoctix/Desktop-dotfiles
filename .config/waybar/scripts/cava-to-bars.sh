#!/bin/bash

bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

# Create FIFO if needed
[[ -p /tmp/cava.fifo ]] || mkfifo /tmp/cava.fifo

# Start cava if not running
pgrep -x cava > /dev/null || cava -p ~/.config/cava/config > /tmp/cava.fifo &

while read -r line; do
  [[ -z "$line" ]] && continue

  out=""
  IFS=';' read -ra values <<< "$line"
  for value in "${values[@]}"; do
    # Skip non-numeric values
    [[ -z "$value" || ! "$value" =~ ^[0-9]+$ ]] && continue

    # Remove leading zeros (e.g. turn 09 → 9)
    dec_value=$(echo "$value" | sed 's/^0*//')
    [[ -z "$dec_value" ]] && dec_value=0

    index=$((dec_value / 128))
    ((index > 7)) && index=7

    out+="${bars[$index]}"
  done

  [[ -n "$out" ]] && echo "$out"
done < /tmp/cava.fifo
