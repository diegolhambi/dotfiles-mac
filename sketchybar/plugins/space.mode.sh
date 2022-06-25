#!/usr/bin/env bash

WINDOW=$(yabai -m query --spaces --space)
ACT_DISPLAY=$(echo "$WINDOW" | jq -r '.display')

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

if [ $ACT_DISPLAY == "$(echo "${NAME}" | cut -d. -f3)" ]; then
    sketchybar -m --set ${NAME} icon="${icon}" drawing=on
else
    sketchybar -m --set ${NAME} drawing=off
fi
