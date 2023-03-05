#!/bin/bash

wifi=(
    align=right
    alias.update_freq=5
    update_freq=5
    updates=on
    background.padding_left=-6
    background.padding_right=-6
    icon.drawing=off
    label.drawing=off
    script="$PLUGIN_DIR/network.wifi.sh"
)

sketchybar -m --add alias "Control Center,WiFi" right \
              --rename "Control Center,WiFi" network.wifi \
              --set network.wifi "${wifi[@]}"