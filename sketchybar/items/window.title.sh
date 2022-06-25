#!/usr/bin/env bash

sketchybar --add item        template.window.title left                   \
           --set template.window.title drawing=off                        \
                              script="$PLUGIN_DIR/window.title.sh"        \
                              updates=on                                  \
                              icon.font="SF Pro:Heavy:13.0"               \
                              icon.color=$COLOR_DESACTIVATED_ICON         \
                              label.color=$COLOR_DESACTIVATED_LABEL       \
                                                                          \
           --add event        window_title_changed                        \
                                                                          \
           --add item window.title.update left                            \
           --set window.title.update drawing=off                          \
                                     updates=on                           \
                                     script="$UPDATE_DIR/window.title.sh" \
           --subscribe        window.title.update display_number_changed