#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors
source "$CONFIG_DIR/icons.sh" # Loads all defined icons

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=$ORANGE
else
    sketchybar --set $NAME background.color=$BACKGROUND_1
fi


if [ "$1" = "$(aerospace list-workspaces --focused)" ]; then
  sketchybar --set $NAME background.color=$ORANGE icon.color=0xFF000000
  # echo "$1 is $FOCUSED_WORKSPACE" >> /tmp/sketchybar_trigger_debug.log 
else
  sketchybar --set $NAME background.color=$BACKGROUND_1 icon.color=$WHITE
  # echo "$1 is not $FOCUSED_WORKSPACE" >> /tmp/sketchybar_trigger_debug.log 
fi


space=$1
apps=$(aerospace list-windows --workspace $space | cut -d '|' -f 2)
icon_strip=" "
icon_name=""
if [ "${apps}" != "" ]; then
  while read -r app
  do
    icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    if [[ $icon_name == "" ]]; then
    icon_name=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    fi
  done <<< "${apps}"
  sketchybar --animate sin 10 --set space.$space label="$icon_strip" \
                                                  label.y_offset=-1 \
                                                  label.padding_right=20 \
                                                  label.color=$ICON_COLOR \
                                                  icon.color=$WHITE
else
  icon_strip=" 􀝶"
  sketchybar --animate sin 10 --set space.$space \
    label="$icon_strip" \
    label.y_offset=0 \
    label.padding_right=15 \
    label.color=$GREY \
    icon.color=$GREY
fi



# for sid in $(aerospace list-workspaces --all | grep -E '^[1-9]$'); do
# space=$sid
# windows=$(aerospace list-windows --workspace $space | cut -d '|' -f 2)
#
# icon_strip=" "
# if [ -n "$windows" ]; then
#   echo "Current windows: $windows" >> /tmp/sketchybar_trigger_debug.log
#   while read -r window; do
#     icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$window")"
#     echo "Current window: $window" >> /tmp/sketchybar_trigger_debug.log
#   done <<< "$windows"
#
#   sketchybar --animate sin 10 --set space.$current_workspace label="$icon_strip" \
#                                                 label.y_offset=-1 \
#                                                 label.padding_right=20 \
#                                                 label.color=$ICON_COLOR \
#                                                 icon.color=$WHITE
# else
#   icon_strip=" 􀝶"
#   sketchybar --animate sin 10 --set space.$current_workspace \
#     label="$icon_strip" \
#     label.y_offset=0 \
#     label.padding_right=15 \
#     label.color=$GREY \
#     icon.color=$GREY
# fi
# done
