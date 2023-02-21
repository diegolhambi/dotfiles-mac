#!/bin/bash

upcoming=(
    update_freq=20
    updates=on
    label.color=$COLOR_DESACTIVATED_LABEL
    background.color=$COLOR_BAR
    popup.height=26
    popup.blur_radius=25
    popup.background.corner_radius=4
    popup.background.color=$COLOR_BAR
    script="python3 $PLUGIN_DIR/upcoming.py"
    click_script="sketchybar -m --set upcoming popup.drawing=toggle"
)

sketchybar --add item upcoming right \
           --set upcoming "${upcoming[@]}"