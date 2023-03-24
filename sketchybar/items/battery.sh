#!/bin/bash

battery=(
    align=right
    alias.update_freq=15
    update_freq=60
    updates=on
    label.drawing=off
    icon.padding_left=3
    icon.padding_right=0
    background.padding_left=-3
    background.padding_right=-3
    script="$PLUGIN_DIR/battery.sh"
    click_script="$PLUGIN_DIR/battery.click.sh"
)

sketchybar --add alias "Control Center,Battery" right \
           --rename "Control Center,Battery" battery \
           --set battery "${battery[@]}" \
           --add event caffeinate        \
           --subscribe battery power_source_change caffeinate
