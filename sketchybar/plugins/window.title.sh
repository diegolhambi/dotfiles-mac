#!/usr/bin/env bash

QUERY=$(yabai -m query --windows --window & disown)
TITLE=$(echo "$QUERY" | jq -r '.title')
ACT_DISPLAY=$(echo "$QUERY" | jq -r '.display')

if [ "${INFO}" == "" ]; then
    INFO=$(echo "$QUERY" | jq -r '.app')
fi

if [[ ${#TITLE} -gt 100 ]]; then
    TITLE="$(echo "$TITLE" | cut -c 1-100)..."
fi

case "$SENDER" in
    "front_app_switched"|"window_title_changed") sketchybar --set $NAME icon="${INFO}" label="${TITLE}"
    ;;
    "display_change") sketchybar --set $NAME associated_display=$INFO
    ;;
esac
