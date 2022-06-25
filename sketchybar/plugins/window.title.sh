#!/usr/bin/env bash

if [ "${NAME}" == "template.window.title" ]; then
    exit 0
fi

QUERY=$(yabai -m query --windows --window & disown)
TITLE=$(echo "$QUERY" | jq -r '.title')
ACT_DISPLAY=$(echo "$QUERY" | jq -r '.display')

if [ "${INFO}" == "" ]; then
    INFO=$(echo "$QUERY" | jq -r '.app')
fi

if [ $ACT_DISPLAY == "$(echo "${NAME}" | cut -d. -f3)" ]; then
    sketchybar -m --set ${NAME} icon="${INFO}" label="${TITLE}" drawing=on
else
    sketchybar -m --set ${NAME} drawing=off
fi
