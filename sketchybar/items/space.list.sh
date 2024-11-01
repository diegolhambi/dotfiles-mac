#!/bin/bash


for sid in $(aerospace list-workspaces --all); do

    space=(
        icon="${sid}"
        icon.width=24
        icon.align=center
        icon.color=$COLOR_DEFAULT_ICON
        icon.highlight_color=$COLOR_DEFAULT_ICON
        background.color=$COLOR_BACKGROUND_HIGHLIGHTED
        background.height=24
        icon.font="$FONT:Bold:14.0"
        background.drawing=off
        label.drawing=off
        label.font="sketchybar-app-font:Regular:13.0"
        label.padding_right=8
        label.color=0xffbbbbbb
        script="$PLUGIN_DIR/space.list.sh ${sid}"
        click_script="aerospace workspace ${sid}"
    )

    sketchybar --add item "space.list.${sid}" left \
               --set "space.list.${sid}" "${space[@]}" \
               --add event aerospace_workspace_change \
               --subscribe space.list.$sid aerospace_workspace_change
               
done
