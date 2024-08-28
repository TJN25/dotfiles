#!/bin/bash

POPUP_OFF='sketchybar --set vnc popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

vnc_item=(
  icon=$DESKTOP
  icon.font="$FONT:Black:16.0"
  icon.color=$ICON_COLOR
  padding_right=15
  # label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  update_freq=1
  popup.height=35
  updates=on
)

# vnc_a8b=(
#   icon=$DESKTOP
#   label="Alma 8 Build"
#   click_script="open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-a8b.vnc; $POPUP_OFF"
# )

# sketchybar --add item vnc.item right                  \
#            --set vnc.item "${vnc_item[@]}"         \
#                                                        \
#            --add item vnc.a8b popup.vnc.item
#            --set  vnc.a8b "${vnc_a8b[@]}"       \



vnc_a8b=(
  icon=$LINUX
  icon.font="MesoLGS NF:Bold:18.0"
  icon.color=$RED
  label="Alma Build 8"
  label.color=$RED
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-a8b.vnc;"
)

vnc_m12=(
  icon=$APPLE
  icon.color=$ORANGE
  label="macos 12"
  label.color=$ORANGE
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-m12.vnc;"
)

vnc_m13=(
  icon=$APPLE
  label="macos 13"
  icon.color=$ORANGE
  label.color=$ORANGE
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-m2-13.vnc;"
)

vnc_m14=(
  icon=$APPLE
  label="macos 14"
  icon.color=$ORANGE
  label.color=$ORANGE
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-m14.vnc;"
)

vnc_a9b=(
  icon=$LINUX
  icon.font="MesoLGS NF:Bold:18.0"
  icon.color=$RED
  label="Alma Build 9"
  label.color=$RED
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-a9b.vnc;"
)

vnc_a8gpu=(
  icon=$LINUX
  icon.font="MesoLGS NF:Bold:18.0"
  icon.color=$RED
  label="Alma GPU 8"
  label.color=$RED
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-a8-gpu.vnc;"
)

vnc_c8t=(
  icon=$LINUX
  icon.font="MesoLGS NF:Bold:18.0"
  icon.color=$RED
  label="Alma Test 8"
  label.color=$RED
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-c8t.vnc;"
)

vnc_a9t=(
  icon=$LINUX
  icon.font="MesoLGS NF:Bold:18.0"
  icon.color=$RED
  label="Alma Test 9"
  label.color=$RED
  click_script="$POPUP_OFF; open -a 'VNC Viewer' /Users/nicth99p/sbgrid/vnc/sbgrid-a9t.vnc;"
)

sketchybar --add item vnc right      \
           --set vnc "${vnc_item[@]}" \
           \
           --add item vnc.a8b popup.vnc     \
           --set vnc.a8b "${vnc_a8b[@]}"       \
           \
           --add item vnc.a9b popup.vnc     \
           --set vnc.a9b "${vnc_a9b[@]}"       \
           \
           --add item vnc.a8gpu popup.vnc     \
           --set vnc.a8gpu "${vnc_a8gpu[@]}"       \
           \
           --add item vnc.a8t popup.vnc     \
           --set vnc.a8t "${vnc_c8t[@]}"       \
           \
           --add item vnc.a9t popup.vnc     \
           --set vnc.a9t "${vnc_a9t[@]}"       \
           \
           --add item vnc.m12 popup.vnc     \
           --set vnc.m12 "${vnc_m12[@]}"       \
           \
           --add item vnc.m13 popup.vnc     \
           --set vnc.m13 "${vnc_m13[@]}"       \
           \
           --add item vnc.m14 popup.vnc     \
           --set vnc.m14 "${vnc_m14[@]}"       \
           \



