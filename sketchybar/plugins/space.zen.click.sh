#!/bin/bash

CURRENT_SPACE=$(yabai -m query --spaces | jq '.[] | select(."has-focus" == true) | .index')
CURRENT_PADDING=$(yabai -m config --space $CURRENT_SPACE right_padding)

case CURRENT_PADDING in
    2) icon="􀋦";;
    450) icon="􀇁";;
esac

if [[ "$CURRENT_PADDING" == 2 ]]; then
    yabai -m space --padding abs:2:2:450:450
elif [[ "$CURRENT_PADDING" == 450 ]]; then
    yabai -m space --padding abs:2:2:2:2
fi

sketchybar -m --trigger space_zen_changed