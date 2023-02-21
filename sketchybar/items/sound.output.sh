#!/bin/bash

output=(
    update_freq=10
    script="$PLUGIN_DIR/sound.output.sh"
)

sketchybar -m --add item sound.output right \
              --set sound.output "${output[@]}" \
              --subscribe sound.output volume_change