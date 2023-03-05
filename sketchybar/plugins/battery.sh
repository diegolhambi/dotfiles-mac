#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$(pgrep -x "caffeinate")" != "" ]; then
    icon="􀸙 "
fi

sketchybar -m --set $NAME icon="$icon"

