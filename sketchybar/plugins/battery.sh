#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

data=$(pmset -g batt)
battery_percent=$(echo $data | grep -Eo "\d+%" | cut -d% -f1)
charging=$(echo $data | grep 'AC Power')

case "$battery_percent" in
    9[0-9]|100) icon="􀛨" color=$COLOR_DEFAULT_ICON ;;
    [7-8][0-9]) icon="􀺸" color=$COLOR_DEFAULT_ICON ;;
    [3-5][0-9]) icon="􀺶" color=$COLOR_DEFAULT_ICON ;;
    [1-2][0-9]) icon="􀛩" color=$COLOR_DEFAULT_ICON ;;
    *)          icon="􀛪" color=$COLOR_DEFAULT_ICON ;;
esac

# if is charging
if ! [ -z "$charging" ]; then
    icon="􀢋"
fi

if [ "$(pgrep -x "caffeinate")" != "" ]; then
    icon="􀸙 ${icon}"
fi

sketchybar -m --set $NAME icon.color="$color" icon="$icon"

