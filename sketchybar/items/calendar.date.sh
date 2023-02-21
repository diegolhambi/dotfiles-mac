#!/bin/bash

date=(
    update_freq=30
    icon=􀉉 
    script="$PLUGIN_DIR/calendar.date.sh"
)

sketchybar --add item calendar.date right \
           --set calendar.date "${date[@]}" \
           --subscribe system_woke
