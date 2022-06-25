#!/usr/bin/env bash

sketchybar -m --add item new.space left         \
              --set new.space icon=􀅼           \
                              label.drawing=off \
                              click_script="yabai -m space --create && sketchybar -m --trigger space_number_changed & disown"