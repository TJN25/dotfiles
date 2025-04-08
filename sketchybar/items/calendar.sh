#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Heavy:13.0"
  label.font="$FONT:Semibold:16.0"
  icon.color=$WHITE
  label.color=$WHITE
  icon.padding_right=2
  background.color=$BACKGROUND_1
  # background.border_color=$ORANGE
  # background.border_width=3
  background.height=33
  label.align=right
  label.padding_right=15
  icon.padding_left=15
  padding_left=0
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar e       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
