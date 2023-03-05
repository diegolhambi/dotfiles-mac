#!/bin/bash

battery=(
    align=right
    alias.update_freq=60
    update_freq=60
    updates=on
    label.drawing=off
    icon.padding_left=0
    icon.padding_right=0
    background.padding_left=-6
    background.padding_right=-4
    script="$PLUGIN_DIR/battery.sh"
    click_script="$PLUGIN_DIR/battery.click.sh"
)

sketchybar --add alias "Control Center,Battery" right \
           --rename "Control Center,Battery" battery \
           --set battery "${battery[@]}" \
           --add event caffeinate        \
           --subscribe battery power_source_change caffeinate
