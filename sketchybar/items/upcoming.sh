#!/usr/bin/env bash

sketchybar --add item upcoming right                                                       \
           --set upcoming label.color=$COLOR_DESACTIVATED_LABEL                            \
                          update_freq=20                                                   \
                          updates=on                                                       \
                          popup.blur_radius=15                                             \
                          popup.background.corner_radius=4                                 \
                          popup.background.color=$COLOR_BAR                                \
                          popup.height=26                                                  \
                          script="python3 $PLUGIN_DIR/upcoming.py"                         \
                          click_script="sketchybar -m --set upcoming popup.drawing=toggle"