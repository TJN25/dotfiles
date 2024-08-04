#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  click_script="$POPUP_CLICK_SCRIPT"
  popup_height=25
  icon.font="$FONT:Regular:19.0"
  padding_right=0
  padding_left=0
  # label.drawing=off
  update_freq=120
  updates=on
)

POPUP_OFF='sketchybar --set battery popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

battery_prefs=(
  icon=$PREFERENCES
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

battery_activity=(
  icon=$ACTIVITY
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

battery_lock=(
  icon=$LOCK
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

sketchybar --add item battery e      \
           --set battery "${battery[@]}" \
           --add item battery.prefs popup.battery     \
           --set battery.prefs "${battery_prefs[@]}"       \
                                                       \
           --add item battery.activity popup.battery  \
           --set battery.activity "${battery_activity[@]}" \
                                                       \
           --add item battery.lock popup.battery      \
           --set battery.lock "${battery_lock[@]}"
           --subscribe battery power_source_change system_woke



