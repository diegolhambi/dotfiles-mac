#!/usr/bin/env bash

sketchybar --add item                template.space.mode left                 \
           --set template.space.mode drawing=off                              \
                                     updates=on                               \
                                     script="$PLUGIN_DIR/space.mode.sh"       \
                                     icon.color=$COLOR_DESACTIVATED_ICON      \
                                     label.drawing=off                        \
           --add event               space_mode_changed                       \
           --add item                space.mode.update left                   \
           --set space.mode.update   drawing=off                              \
                                     updates=on                               \
                                     script="$UPDATE_DIR/space.mode.sh"       \
           --subscribe               space.mode.update display_number_changed