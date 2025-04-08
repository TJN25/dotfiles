#!/bin/bash

source ~/.config/sketchybar/colors.sh

# if [ "$SENDER" = "space_windows_change" ]; then
#   space="$(echo "$INFO" | jq -r '.space')"
#   apps="$(echo "$INFO" | jq -r '.apps | keys[]')"
#
#   icon_strip=" "
#   icon_name=""
#   if [ "${apps}" != "" ]; then
#     while read -r app
#     do
#       icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
#       if [[ $icon_name == "" ]]; then
#       icon_name=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
#       fi
#     done <<< "${apps}"
#     sketchybar --animate sin 10 --set space.$space label="$icon_strip" \
#                                                     label.y_offset=-1 \
#                                                     label.padding_right=20 \
#                                                     label.color=$ICON_COLOR \
#                                                     icon.color=$WHITE
#   else
#     icon_strip=" 􀝶"
#     sketchybar --animate sin 10 --set space.$space \
#       label="$icon_strip" \
#       label.y_offset=0 \
#       label.padding_right=15 \
#       label.color=$GREY \
#       icon.color=$GREY
#   fi
# fi

update_window_icons() {
  space=$(aerospace list-workspaces --focused)
  apps=$(aerospace list-windows --workspace $current_workspace)
  
  icon_strip=" "
  if [ -n "$windows" ]; then
    while read -r window; do
      app=$(echo "$window" | awk -F '"' '{print $4}')
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    done <<< "$windows"
    
    sketchybar --animate sin 10 --set space.$current_workspace label="$icon_strip" \
                                                  label.y_offset=-1 \
                                                  label.padding_right=20 \
                                                  label.color=$ICON_COLOR \
                                                  icon.color=$WHITE
  else
    icon_strip=" 􀝶"
    sketchybar --animate sin 10 --set space.$current_workspace \
      label="$icon_strip" \
      label.y_offset=0 \
      label.padding_right=15 \
      label.color=$GREY \
      icon.color=$GREY
  fi
}

if [ "$SENDER" = "space_windows_change" ] || [ "$SENDER" = "aerospace_workspace_change" ]; then
  update_window_icons
fi
