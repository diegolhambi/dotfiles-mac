#!/bin/bash

clock=(
    update_freq=1
    icon.drawing=off
    label.padding_left=0
    background.padding_left=0
    script="$PLUGIN_DIR/calendar.clock.sh"
)

sketchybar --add item calendar.clock right    \
           --set calendar.clock "${clock[@]}" \
           --subscribe system_woke
