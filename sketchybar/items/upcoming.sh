#!/bin/bash

upcoming=(
    update_freq=20
    updates=on
    label.color=$COLOR_DESACTIVATED_LABEL
    script="python3 $PLUGIN_DIR/upcoming.py"
)

sketchybar --add item upcoming right \
           --set upcoming "${upcoming[@]}"
