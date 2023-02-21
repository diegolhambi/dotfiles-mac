#!/bin/bash

battery=(
    update_freq=60
    updates=on
    script="$PLUGIN_DIR/battery.sh"
    click_script="$PLUGIN_DIR/battery.click.sh"
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --add event caffeinate        \
           --subscribe battery power_source_change caffeinate
