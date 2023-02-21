#!/bin/bash

NOTIFICATION=$(lsappinfo -all info Discord -only StatusLabel | awk -F\" '{print $6}')

if [[ $NOTIFICATION != "" ]]; then
    sketchybar -m --set message.indicator icon.drawing=on
else
    sketchybar -m --set message.indicator icon.drawing=off
fi
