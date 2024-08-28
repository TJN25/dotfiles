#!/bin/bash

source ~/.config/sketchybar/colors.sh
icon_strip="$($CONFIG_DIR/plugins/icon_map.sh "Slack")"
sketchybar --set $NAME label.color=$ICON_COLOR label="$icon_strip" icon.color=$COLOR