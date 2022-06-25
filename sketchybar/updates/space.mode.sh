#!/usr/bin/env bash

args=()
DISPLAYS="$(yabai -m query --displays | jq -rc '.[] | .index | @sh')"

for display in $DISPLAYS; do
    args+=(--clone     "space.mode.${display}" template.space.mode before
           --set       "space.mode.${display}" associated_display=${display} drawing=on
           --subscribe "space.mode.${display}" space_mode_changed front_app_switched)
done

sketchybar -m ${args[@]} &>/dev/null