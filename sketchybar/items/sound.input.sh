#!/bin/bash

input=(
    update_freq=2
    icon=􀊰
    label.drawing=off
    script="$PLUGIN_DIR/sound.input.sh"
    click_script="$PLUGIN_DIR/sound.input.click.sh"
)

sketchybar -m --add item sound.input right \
              --set sound.input "${input[@]}"