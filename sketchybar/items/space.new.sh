#!/bin/bash

new=(
    icon=􀅼
    label.drawing=off
    display=active
    #click_script="yabai -m space --create && sketchybar --update & disown"
    script="$PLUGIN_DIR/space.windows.sh"
)

sketchybar -m --add item space.new left \
              --set space.new "${new[@]}" \
              --subscribe space.new aerospace_workspace_change \
              --subscribe space.new front_app_switched
