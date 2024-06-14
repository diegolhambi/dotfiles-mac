#!/bin/bash

new=(
    icon=􀅼
    label.drawing=off
    display=active
    click_script="yabai -m space --create && sketchybar --update & disown"
    script="$PLUGIN_DIR/space.windows.sh"
)

sketchybar -m --add item space.new left \
              --set space.new "${new[@]}" \
              --subscribe space.new space_windows_change front_app_switched
