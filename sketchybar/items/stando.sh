#!/bin/bash

wifi=(
    align=right
    alias.update_freq=5
    update_freq=5
    updates=on
    icon.drawing=off
    label.drawing=off
)

sketchybar -m --add alias "Stando,Item-0" left \
              --rename "Stando,Item-0" stando \
              --set stando "${wifi[@]}"
