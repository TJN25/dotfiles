#!/bin/bash

for sid in $(aerospace list-workspaces --all); do

      case "$sid" in
      "1") SPACE_NAME="dev"
      ;;
      "2") SPACE_NAME="www"
      ;;
      "3") SPACE_NAME="sbg"
      ;;
      "4") SPACE_NAME="vnc"
      ;;
      "5") SPACE_NAME="com"
      ;;
      "6") SPACE_NAME="mon"
      ;;
      *) SPACE_NAME="$sid"
      ;;
    esac

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon=$SPACE_NAME \
        icon.padding_left=10 \
        icon.font="$FONT:Heavy:14.0" \
        icon.padding_right=0 \
        padding_left=2 \
        padding_right=2 \
        label.padding_right=20 \
        label.padding_left=0 \
        icon.highlight_color=$BLACK \
        icon.color=$WHITE \
        label.color=$ICON_COLOR \
        label.highlight_color=$BLACK \
        label.font="sketchybar-app-font:Regular:12.0" \
        label.y_offset=-1 \
        background.color=$BACKGROUND_1 \
        background.border_color=$BACKGROUND_2 \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"

  if [ "$sid" = "$(aerospace list-workspaces --focused)" ]; then
    sketchybar --set space.$sid background.color=$ORANGE icon.color=0xFF000000
  else
    sketchybar --set space.$sid background.color=$BACKGROUND_1 icon.color=$WHITE
  fi

done

# space_creator=(
#   icon.font="$FONT:Black:16.0"
#   padding_left=10
#   padding_right=8
#   label.drawing=off
#   display=active
#   click_script='aerospace workspace new'
#   script="$PLUGIN_DIR/space_windows.sh"
#   icon.color=$MAGENTA
# )
#
# sketchybar --add item space_creator left               \
#            --set space_creator "${space_creator[@]}"   \
#            --subscribe space_creator aerospace_workspace_change

# spaces_bracket=(
#   background.color=$BACKGROUND_1
#   background.border_color=$TRANSPARENT
#   background.border_width=3
#   background.height=38
# )
#
# sketchybar --add bracket spaces_group space.1 space.2 space.3 space.4 space.5 space.6 space.7 space.8 space.9 \
#            --set spaces_group "${spaces_bracket[@]}"
#
# app_bracket=(
#   background.color=$TRANSPARENT
#   background.border_color=$TRANSPARENT
#   background.border_width=3
#   background.height=38
# )
#
# sketchybar --add bracket app_group space_creator front_app\
#            --set app_group "${app_bracket[@]}"
