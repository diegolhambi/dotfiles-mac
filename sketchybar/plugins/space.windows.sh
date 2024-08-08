#!/bin/bash
source "$HOME/.config/sketchybar/icon_map.sh"


if [ "$SENDER" = "space_windows_change" ]; then
  space="$(echo "$INFO" | jq -r '.space')"
else
  space=$(yabai -m query --spaces --space | jq -r '.index')
fi

apps=$(yabai -m query --windows --space $space | jq -r 'map(select(.["is-hidden"] == false and .layer != "unknown" and (.title | startswith("Círculo") | not))) | .[].app')

args=()

icon_strip=" "
if [ "${apps}" != "" ]; then
  while read -r app
  do
    __icon_map "$app"
    icon_strip+=" $icon_result"
  done <<< "${apps}"
  args+=(--set space.list.$space label.drawing=on)
else
  args+=(--set space.list.$space label.drawing=off)
fi
args+=(--set space.list.$space label="$icon_strip")

sketchybar -m "${args[@]}"
