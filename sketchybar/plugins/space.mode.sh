#!/bin/bash

WINDOW=$(yabai -m query --spaces --space)

case "$(echo "$WINDOW" | jq -rc '.type')" in
    "bsp")
      icon="􀛧"
      ;;
    "stack")
      icon="􀏮"
      ;;
    "float")
      icon="􀚅"
      ;;
esac

case "$SENDER" in
    "front_app_switched"|"space_mode_changed") sketchybar --set $NAME icon="${icon}"
    ;;
    "display_change") sketchybar --set $NAME associated_display=$INFO
    ;;
esac
