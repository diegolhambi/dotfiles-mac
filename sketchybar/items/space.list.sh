#!/usr/bin/env bash

sketchybar --add space          template.space.list left                        \
           --set template.space.list                                            \
                                icon.width=24                                   \
                                icon.align=center                               \
                                icon.color=$COLOR_DEFAULT_ICON                  \
                                icon.highlight_color=$COLOR_DEFAULT_ICON        \
                                background.color=$COLOR_BACKGROUND_HIGHLIGHTED  \
                                background.height=24                            \
                                                                                \
                                label.drawing=off                               \
                                drawing=off                                     \
                                updates=on                                      \
                                icon.font="SF Pro:Bold:14.0"                    \
                                script="$PLUGIN_DIR/space.list.sh"              \
                                click_script="yabai -m space --focus \$SID"     \
                                                                                \
           --add event          space_changed                                   \
                                                                                \
           --add item           yabai_spaces left                               \
           --set yabai_spaces   drawing=off                                     \
                                updates=on                                      \
                                script="$UPDATE_DIR/space.list.sh"              \
           --add event          display_number_changed                          \
           --add event          space_number_changed                            \
           --subscribe yabai_spaces display_number_changed space_number_changed 
