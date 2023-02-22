#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

toggle_mute() {
    LEVEL=50

    VOLUME=$(osascript -e 'input volume of (get volume settings)')

    ALLOWED_INPUTS=('External Microphone' 'MacBook Air Microphone')
    ACTUAL_INPUT=$(SwitchAudioSource -t input -c & disown)

    if [[ ! "${ALLOWED_INPUTS[*]}" =~ "${ACTUAL_INPUT}" ]]; then
        exit 0
    fi

    if [ $VOLUME == 0 ]; then
        osascript -e "set volume input volume ${LEVEL}"
    else
        osascript -e 'set volume input volume 0'
    fi

    sketchybar -m --trigger toggle_mute
}

toggle_input() {
    args=(--remove '/volume.device\.*/' --set "$NAME" popup.drawing=toggle)
    
    COUNTER=0
    CURRENT="$(SwitchAudioSource -t input -c)"
    
    while IFS= read -r device; do
        COLOR=$COLOR_DESACTIVATED_LABEL
    
        if [ "${device}" = "$CURRENT" ]; then
            COLOR=$COLOR_DEFAULT_LABEL
        fi

        args+=(--add item volume.device.$COUNTER popup."$NAME" \
                --set volume.device.$COUNTER label="${device}" \
                                            label.color=$COLOR \
                        click_script="SwitchAudioSource -t input -s \"${device}\" && sketchybar --set /volume.device\.*/ label.color=$COLOR_DESACTIVATED_LABEL --set \$NAME label.color=$COLOR_DEFAULT_LABEL --set $NAME popup.drawing=off && sketchybar -m --trigger toggle_mute")
    
        COUNTER=$((COUNTER+1))
    done <<< "$(SwitchAudioSource -a -t input)"

    sketchybar -m "${args[@]}"
}


if [ "$BUTTON" = "right" ] || [ "$MODIFIER" = "shift" ]; then
  toggle_input
else
  toggle_mute
fi
