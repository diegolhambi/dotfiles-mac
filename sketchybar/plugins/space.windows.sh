#!/bin/bash
source "$HOME/.config/sketchybar/icon_map.sh"

all_apps_space=$(aerospace list-windows --all --format "%{workspace}%{app-name}" --json)
all_spaces=$(aerospace list-workspaces --all)

while read -r space; do
  apps=$(echo "$all_apps_space" | jq -r ".[] | select(.workspace == \"$space\") | .\"app-name\"")
  args=()
  text=""

  if [[ -n "$apps" ]]; then
    while read -r app; do
      __icon_map "$app"
      text+="$icon_result"
    done <<< "$apps"

    args+=(--set space.list.$space label.drawing=on label="$text")
  else
    args+=(--set space.list.$space label.drawing=off label="")
  fi

  sketchybar -m "${args[@]}"
done <<< "$all_spaces"

spaces_per_monitor=$(aerospace list-workspaces --all --format "%{monitor-id}|%{workspace}")
map_monitor=($(yabai -m query --displays | jq -r 'sort_by(.id) | .[].index'))
args=()

while IFS="|" read -r monitor space; do
  args+=(--set space.list.$space display=${map_monitor[$(($monitor - 1))]})
done <<< "$spaces_per_monitor"

sketchybar -m "${args[@]}"