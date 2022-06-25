#!/usr/bin/env bash

sketchybar --add item calendar.clock right                             \
           --set calendar.clock update_freq=1                          \
                                icon=􀐫                                \
                                background.padding_left=0              \
                                label.padding_left=0                   \
                                icon.drawing=off                       \
                                click_script="osascript -e 'tell application \"System Events\" to click menu bar item \"Clock\" of menu bar 1 of application process \"ControlCenter\"'" \
                                script="$PLUGIN_DIR/calendar.clock.sh"