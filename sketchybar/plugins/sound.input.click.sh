#!/usr/bin/env bash

source "$(dirname $(dirname $0))/colors.sh"

if [ -f "/tmp/sound.input.level" ]; then
    LEVEL=$(cat /tmp/sound.input.level)
else
    LEVEL=$(osascript -e 'set ovol to input volume of (get volume settings)')
fi

if [ $LEVEL == 0 ]; then
    LEVEL=50
fi

echo "$LEVEL" > /tmp/sound.input.level

VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [ $VOLUME == 0 ]; then
    osascript -e "set volume input volume ${LEVEL}"
    sketchybar --set $NAME icon="􀊱" icon.color=$COLOR_WARNING_ICON
else
    osascript -e 'set volume input volume 0'
    sketchybar --set $NAME icon="􀊲" icon.color=$COLOR_DEFAULT_ICON
fi
