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


process_space () {
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
                                                  icon.drawing=on \
                                                  label.y_offset=-1 \
                                                  label.padding_right=20 \
                                                  label.color=$ICON_COLOR \
                                                  icon.color=$WHITE
else
  if [ "$space" = "$(aerospace list-workspaces --focused)" ]; then
    icon_strip=" 􀝶"
    sketchybar --animate sin 10 --set space.$space \
      icon.drawing=on \
      label="$icon_strip" \
      label.y_offset=0 \
      label.padding_right=15 \
      label.color=$GREY \
      icon.color=$GREY
  else
    sketchybar --animate sin 10 --set space.$space \
        background.drawing=off \
        icon.drawing=off \
        padding_left=0 \
        padding_right=0
    # sketchybar --set space.$space drawing=off
  fi
fi
}

process_space $1

# SPACE_ICONS=($(aerospace list-workspaces --all))
#
# for i in "${!SPACE_ICONS[@]}"
# do
#   space=${SPACE_ICONS[$i]}
#   process_space $space
#   if [ "$space" = "$(aerospace list-workspaces --focused)" ]; then
#     sketchybar --set space.$space background.color=$ORANGE icon.color=0xFF000000
#   else
#     sketchybar --set space.$space background.color=$BACKGROUND_1 icon.color=$WHITE
#   fi
# done

