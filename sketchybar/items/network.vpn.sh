#!/bin/bash

vpn=(
    update_freq=5
    updates=on
    icon=􀌋
    label.drawing=off
    script="$PLUGIN_DIR/network.vpn.sh"
)

sketchybar -m --add item network.vpn right \
              --set network.vpn "$vpn[@]"
