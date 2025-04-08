#!/bin/bash

source "$CONFIG_DIR/colors.sh"

update_workspaces() {
  # Get current workspaces and focused workspace
  workspaces=$(aerospace list-workspaces --monitor focused --empty no)
  current_workspace=$(aerospace workspace current --monitor focused)
  
  # Clear existing workspace items
  for i in {1..12}; do
    sketchybar --set space.$i drawing=off
  done
  
  # Create workspace items
  index=1
  for workspace in $workspaces; do
    # Set workspace name based on index (similar to your current setup)
    case "$index" in
      "1") SPACE_NAME="dev"
      ;;
      "2") SPACE_NAME="www"
      ;;
      "3") SPACE_NAME="sbg"
      ;;
      "4") SPACE_NAME="vnc"
      ;;
      "5") SPACE_NAME="com"
      ;;
      *) SPACE_NAME="$workspace"
      ;;
    esac
    
    # Set colors based on whether workspace is focused
    if [ "$workspace" = "$current_workspace" ]; then
      COLOR=$ORANGE
      SELECTED="true"
    else
      COLOR=$BACKGROUND_2
      SELECTED="false"
    fi
    
    # Update space item
    sketchybar --set space.$index drawing=on \
                               icon="$SPACE_NAME" \
                               icon.highlight=$SELECTED \
                               label.highlight=$SELECTED \
                               background.color=$COLOR
    
    index=$((index+1))
  done
}

# Run on script execution
update_workspaces

# If called with aerospace_workspace_change event
if [ "$SENDER" = "aerospace_workspace_change" ]; then
  update_workspaces
fi

