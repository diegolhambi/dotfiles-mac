#!/bin/bash

wifi=(
    update_freq=5
    updates=on
    icon=􀙇
    label.drawing=off
    script="$PLUGIN_DIR/network.wifi.sh"
)

sketchybar -m --add item network.wifi right \
              --set network.wifi "${wifi[@]}"