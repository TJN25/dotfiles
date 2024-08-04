#!/bin/bash

front_app=(
  label.font="$FONT:Black:14.0"
  padding_right=10
  label.padding_right=10
  label.padding_left=5
  icon.padding_left=2
  # label.color=$BLACK
  icon.background.drawing=on
  label.max_chars=2
  scroll_texts=on
  scroll_duration=2
  updates=on
  background.color=$RED
  display=active
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
