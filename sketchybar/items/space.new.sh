#!/bin/bash

new=(
    icon=􀅼
    label.drawing=off
    click_script="yabai -m space --create && sketchybar --update & disown"
)

sketchybar -m --add item space.new left \
              --set space.new "${new[@]}"