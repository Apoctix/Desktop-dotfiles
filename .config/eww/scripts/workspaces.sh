#!/bin/bash

get_workspaces() {
    ACTIVE_WORKSPACE=$(hyprctl activewindow -j | jq -r ".workspace.id")
    WORKSPACES=$(hyprctl workspaces -j)
    
    workspace_data=()
    for i in {1..5}; do
        windows=$(echo "$WORKSPACES" | jq -r ".[] | select(.id == $i) | .windows")
        if [ "$i" = "$ACTIVE_WORKSPACE" ]; then
            workspace_data+=("(box :class \"workspace-active\" (button :onclick \"hyprctl dispatch workspace $i\" \"󰮯\"))")
        elif [ -n "$windows" ] && [ "$windows" != "null" ] && [ "$windows" -gt 0 ]; then
            workspace_data+=("(box :class \"workspace-occupied\" (button :onclick \"hyprctl dispatch workspace $i\" \"󰊠\"))")
        else
            workspace_data+=("(box :class \"workspace-empty\" (button :onclick \"hyprctl dispatch workspace $i\" \"󰧞\"))")
        fi
    done
    
    echo "(box :class \"workspaces\" :orientation \"h\" :space-evenly true :halign \"center\" ${workspace_data[*]})"
}

handle_workspace_change() {
    get_workspaces
}

# Initial workspace state
handle_workspace_change

# Monitor workspace changes
socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    case "$line" in
        *"workspace>"*|*"focusedmon>"*|*"activewindow>>"*)
            handle_workspace_change
            ;;
    esac
done
