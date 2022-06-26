#!/usr/bin/env bash

sketchybar --add item calendar.date right                            \
           --set calendar.date update_freq=30                        \
                               icon=􀉉                               \
                               click_script="open -a 'Calendar'"     \
                               script="$PLUGIN_DIR/calendar.date.sh"