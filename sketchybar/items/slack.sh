#!/bin/bash

CLICK_SCRIPT="open -a 'Slack';"

slack=(
  script="$PLUGIN_DIR/slack.sh"
  click_script="$CLICK_SCRIPT"
  popup_height=25
  icon.font="$FONT:Regular:19.0"
  label.font="sketchybar-app-font:Regular:18.0"
  padding_right=0
  padding_left=0
  # label.drawing=off
  update_freq=15
  updates=on
)

sketchybar --add item Slack right      \
           --set Slack "${slack[@]}"



