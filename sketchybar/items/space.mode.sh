#!/usr/bin/env bash

sketchybar --add item       space_mode left                     \
           --set space_mode script="$PLUGIN_DIR/space.mode.sh"  \
                            icon.color=$COLOR_DESACTIVATED_ICON \
                            label.drawing=off                   \
           --add event      space_mode_changed                  \
           --subscribe      space_mode space_mode_changed front_app_switched