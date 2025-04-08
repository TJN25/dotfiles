#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$ORANGE
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$BACKGROUND_2
  slider.knob=􀀁
  slider.knob.drawing=on
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=0
  icon=$VOLUME_100
  icon.width=0
  icon.align=left
  icon.color=$ORANGE
  icon.font="$FONT:Regular:14.0"
  label.width=25
  label.align=left
  label.font="$FONT:Regular:14.0"
  label.color=$ORANGE
)

status_bracket=(
  background.color=$BACKGROUND_1
  # background.border_color=$RED
  # background.border_width=3
  background.height=33
)

sketchybar --add slider volume r            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                                                \
           --add item volume_icon r         \
           --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket status volume_icon battery wifi \
           --set status "${status_bracket[@]}"
