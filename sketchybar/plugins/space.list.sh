#!/bin/bash

echo $1
echo $FOCUSED_WORKSPACE
echo $NAME

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon.highlight=on background.drawing=on
else
    sketchybar --set $NAME icon.highlight=off background.drawing=off
fi