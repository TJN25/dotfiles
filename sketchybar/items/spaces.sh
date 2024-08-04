#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  if [[ $i -eq 0 ]]; then
    SPACE_NAME="term"
  fi

  case "$i" in
    "0") SPACE_NAME="dev"
    ;;
    "1") SPACE_NAME="www"
    ;;
    "2") SPACE_NAME="sbg"
    ;;
    "3") SPACE_NAME="obs"
    ;;
    "4") SPACE_NAME="com"
    ;;
    *) SPACE_NAME="${SPACE_ICONS[i]}"
    ;;
  esac
  space=(
    space=$sid
    icon=$SPACE_NAME
    icon.padding_left=10
    icon.font="$FONT:Heavy:14.0"
    icon.padding_right=0
    padding_left=2
    padding_right=2
    label.padding_right=20
    label.padding_left=0
    icon.highlight_color=$BLACK
    icon.color=$WHITE
    label.color=$ICON_COLOR
    label.highlight_color=$BLACK
    label.font="sketchybar-app-font:Regular:12.0"
    label.y_offset=-1
    background.color=$BACKGROUND_1
    background.border_color=$BACKGROUND_2
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done


space_creator=(
  # icon=􀆊
  icon.font="$FONT:Black:16.0"
  padding_left=10
  padding_right=8
  label.drawing=off
  display=active
  click_script='yabai -m space --create'
  script="$PLUGIN_DIR/space_windows.sh"
  icon.color=$MAGENTA
)

sketchybar --add item space_creator left               \
           --set space_creator "${space_creator[@]}"   \
           --subscribe space_creator space_windows_change

spaces_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$TRANSPARENT
  background.border_width=3
  background.height=38
)

sketchybar --add bracket spaces_group space.1 space.2 space.3 space.4 space.5 space.6 space.7 \
           --set spaces_group "${spaces_bracket[@]}"

app_bracket=(
  background.color=$TRANSPARENT
  background.border_color=$TRANSPARENT
  background.border_width=3
  background.height=38
)

sketchybar --add bracket app_group space_creator front_app\
           --set app_group "${app_bracket[@]}"
