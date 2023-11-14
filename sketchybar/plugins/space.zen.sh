#!/bin/bash

CURRENT_SPACE=$(yabai -m query --spaces | jq '.[] | select(."has-focus" == true) | .index')
CURRENT_PADDING=$(yabai -m config --space $CURRENT_SPACE right_padding)

case $CURRENT_PADDING in
    4) icon="􀋦";;
    450) icon="􀇁";;
esac

sketchybar --set $NAME icon="${icon}"
