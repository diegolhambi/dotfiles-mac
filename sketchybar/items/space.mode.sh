#!/bin/bash

mode=(
    updates=on
    icon.color=$COLOR_DESACTIVATED_ICON
    label.drawing=off
    script="$PLUGIN_DIR/space.mode.sh"
)

sketchybar --add item space.mode left \
           --set space.mode "${mode[@]}" \
           --add event space_mode_changed \
           --subscribe space.mode space_mode_changed front_app_switched display_change