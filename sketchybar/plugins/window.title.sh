#!/bin/bash

QUERY=$(yabai -m query --windows --window & disown)
TITLE=$(echo "$QUERY" | jq -r '.title')

if [ "${INFO}" == "" ]; then
    INFO=$(echo "$QUERY" | jq -r '.app')
fi

if [[ ${#TITLE} -gt 50 ]]; then
    TITLE="$(echo "$TITLE" | cut -c 1-50)..."
fi

case "$SENDER" in
    "front_app_switched"|"window_title_changed") sketchybar --set $NAME icon="${INFO}" label="${TITLE}"
    ;;
esac
