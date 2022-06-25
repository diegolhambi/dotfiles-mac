#!/usr/bin/env bash

args=()
DISPLAYS="$(yabai -m query --displays | jq -rc '.[] | .index | @sh')"

for display in $DISPLAYS; do
    args+=(--clone     "window.title.${display}" template.window.title before
           --set       "window.title.${display}" associated_display=${display} drawing=on
           --subscribe "window.title.${display}" front_app_switched window_title_changed)
done

sketchybar -m ${args[@]} &>/dev/null