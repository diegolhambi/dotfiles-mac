#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [ $VOLUME == 0 ]; then
    icon="􀊲"
    color=$COLOR_DEFAULT_ICON
else
    icon="􀊱"
    color=$COLOR_WARNING_ICON
fi

ALLOWED_INPUTS=('External Microphone' 'MacBook Air Microphone')
ACTUAL_INPUT=$(SwitchAudioSource -t input -c & disown)

if [[ ! "${ALLOWED_INPUTS[*]}" =~ "${ACTUAL_INPUT}" ]]; then
    icon="􁙄"
    color=$COLOR_ATTENTION_ICON
fi

case "${ACTUAL_INPUT}" in
    'MacBook Air Microphone') label=􀟛  ;;
    'External Microphone') label=􀑫  ;;
    *) label=􀁜 ;;
esac

sketchybar --set $NAME icon="${icon}" icon.color="${color}" label="${label}"