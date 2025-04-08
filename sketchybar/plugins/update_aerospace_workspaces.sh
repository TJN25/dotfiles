#!/bin/bash

echo "Script triggered at $(date) with CURRENT=$CURRENT" >> /tmp/sketchybar_trigger_debug.log
# Colors
BACKGROUND_1=0xFF1E1E2E
ORANGE=0xFFFFAA00
WHITE=0xFFCDD6F4

# Get current workspace
current=$(aerospace list-workspaces --focused)

# Update all workspace items
for i in {1..8}
do
  item_name="aerospace_ws_$i"
  
  if [ "$i" = "$current" ]; then
    # Highlight current workspace
    sketchybar --set $item_name background.color=$ORANGE icon.color=0xFF000000
  else
    # Normal appearance for other workspaces
    sketchybar --set $item_name background.color=$BACKGROUND_1 icon.color=$WHITE
  fi
done
