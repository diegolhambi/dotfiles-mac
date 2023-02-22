#!/bin/bash

input=(
    update_freq=10
    icon=􀊰
    label.drawing=off
    popup.height=26
    popup.blur_radius=25
    popup.background.corner_radius=4
    popup.background.color=$COLOR_BAR 
    script="$PLUGIN_DIR/sound.input.sh"
    click_script="$PLUGIN_DIR/sound.input.click.sh"
)

sketchybar -m --add item sound.input right \
              --set sound.input "${input[@]}" \
              --add event toggle_mute \
              --subscribe sound.input toggle_mute