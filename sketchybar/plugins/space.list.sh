#!/usr/bin/env bash

update() {
    args=()

    if [ "$NAME" == "template.space.list" ]; then
        exit 0
    fi

    active_spaces=$(yabai -m query --spaces | jq -r 'map(select(."is-visible" == true)) | .[] | .index | @sh')
    space=$(echo $NAME | cut -d. -f2)
    if [[ "${active_spaces[*]}" =~ "$space" ]]; then
        SELECTED=on
    fi

    args+=(--set $NAME label=$NAME icon.highlight=$SELECTED background.drawing=$SELECTED)

    sketchybar -m "${args[@]}"
}

case "$SENDER" in
    "mouse.entered") sketchybar --set $NAME background.drawing=on #Inactive
    ;;
    "mouse.exited") sketchybar --set $NAME background.drawing=off #Inactive
    ;;
    *) update
    ;;
esac