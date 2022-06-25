#!/usr/bin/env bash

sketchybar -m --add item sound.input right                          \
              --set sound.input                                     \
                    icon=􀊰                                         \
                    label.drawing=off                               \
                    update_freq=0                                   \
                    script="$PLUGIN_DIR/sound.input.sh"             \
                    click_script="$PLUGIN_DIR/sound.input.click.sh"