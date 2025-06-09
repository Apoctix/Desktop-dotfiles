#!/bin/bash

# Kill any existing EWW daemon
pkill eww

# Wait for a moment to ensure the previous daemon is killed
sleep 1

# Start EWW daemon and open bars
eww daemon
eww open bar
eww open bar_secondary
