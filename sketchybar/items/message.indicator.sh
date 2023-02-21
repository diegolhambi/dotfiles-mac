#!/bin/bash

indicator=(
    update_freq=5
    icon=􁋭
    icon.drawing=off
    icon.color=$COLOR_ATTENTION_LABEL
    label.drawing=off
    script="$PLUGIN_DIR/message.indicator.sh"
)

sketchybar -m --add item message.indicator right \
              --set message.indicator "${indicator[@]}"
