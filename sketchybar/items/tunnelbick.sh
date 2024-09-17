#!/bin/bash

CLICK_SCRIPT="open -a 'Tunnelblick.app';"

tunnelbick=(
  script="$PLUGIN_DIR/tunnelbick.sh"
  click_script="$CLICK_SCRIPT"
  popup_height=25
  icon.font="$FONT:Regular:19.0"
  padding_right=0
  padding_left=0
  # label.drawing=off
  update_freq=15
  updates=on
)

sketchybar --add alias Tunnelblick right      \
           --set Tunnelblick "${tunnelbick[@]}"



