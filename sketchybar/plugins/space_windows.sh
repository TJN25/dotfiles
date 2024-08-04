#!/bin/bash

source ~/.config/sketchybar/colors.sh

if [ "$SENDER" = "space_windows_change" ]; then
  space="$(echo "$INFO" | jq -r '.space')"
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

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
fi
