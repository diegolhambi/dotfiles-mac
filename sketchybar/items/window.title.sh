#!/bin/bash

title=(
    updates=on
    drawing=on
    icon.font="$FONT:Heavy:13.0"
    icon.color=$COLOR_DESACTIVATED_ICON
    label.color=$COLOR_DESACTIVATED_LABEL
    script="$PLUGIN_DIR/window.title.sh"
)

sketchybar --add item window.title left     \
           --set window.title "${title[@]}" \
           --add event window_title_changed \
           --subscribe window.title front_app_switched display_change window_title_changed