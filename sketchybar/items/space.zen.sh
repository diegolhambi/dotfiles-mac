#!/bin/bash

mode=(
    updates=on
    drawing=on
    icon.color=$COLOR_DESACTIVATED_ICON
    label.drawing=off
    associated_display=active
    script="$PLUGIN_DIR/space.zen.sh"
    click_script="$PLUGIN_DIR/space.zen.click.sh"
)

sketchybar --add item space.zen left \
           --set space.zen "${mode[@]}" \
           --add event space_zen_changed \
           --subscribe space.zen space_zen_changed front_app_switched