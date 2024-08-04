#!/bin/bash

POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'
POPUP_OFF='sketchybar --set controlcenter popup.drawing=off'

controlcenter=(
  # script="$PLUGIN_DIR/tunnelbick.sh"
  click_script="$POPUP_CLICK_SCRIPT"
  popup_height=25
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  label.drawing=on
  label="Control Center"
  update_freq=1
  updates=on
)
sketchybar --add item controlcenter right      \
           --set controlcenter "${controlcenter[@]}" \
                                                        \
           --add item controlcenter.wifi popup.controlcenter     \
           --set controlcenter.wifi "${controlcenter_wifi[@]}"       \
                                                        \
           --add item controlcenter.bluetooth popup.controlcenter     \
           --set controlcenter.bluetooth "${controlcenter_bluetooth[@]}"       \
                                                       \
           --add item controlcenter.display popup.controlcenter     \
           --set controlcenter.display "${controlcenter_display[@]}"       \
                                                       \
           --add item controlcenter.profile popup.controlcenter     \
           --set controlcenter.profile "${controlcenter_profile[@]}"       \


controlcenter_wifi=(
  icon=$PREFERENCES
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

controlcenter_bluetooth=(
  icon=$ACTIVITY
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

controlcenter_display=(
  icon=$LOCK
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

controlcenter_profile=(
  icon=$LOCK
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

