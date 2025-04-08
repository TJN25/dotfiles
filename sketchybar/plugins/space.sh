#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$BACKGROUND_2
  DRAW_ICON=on
  if [ "$SELECTED" = "true" ]; then
    COLOR=$ORANGE
    DRAW_ICON=off
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.color=$COLOR \
                         icon.drawing=$DRAW_ICON
                         # icon.drawing=off
}

set_space_label() {
  sketchybar --set $NAME icon="$@"
}

mouse_clicked() {
    if [ "$BUTTON" = "right" ]; then
    aerospace workspace remove
  else
    if [ "$MODIFIER" = "shift" ]; then
      SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Give a name to space $NAME:\" default answer \"\" with icon note buttons {\"Cancel\", \"Continue\"} default button \"Continue\"))")"
      if [ $? -eq 0 ]; then
        if [ "$SPACE_LABEL" = "" ]; then
          set_space_label "${NAME:6}"
        else
          set_space_label "$SPACE_LABEL"
        fi
      fi
    else
      aerospace workspace $SID
    fi
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "aerospace_workspace_change") 
    # Get current workspace from the event info
    CURRENT_WORKSPACE="$CURRENT"
    
    # Update all space items
    for i in {1..12}; do
      # Set SELECTED based on whether this space matches the current workspace
      if [ "$i" = "$CURRENT_WORKSPACE" ]; then
        SELECTED="true"
      else
        SELECTED="false"
      fi
      
      # Call update with the space name and SELECTED value
      NAME="space.$i"
      update
    done
  ;;
  *) update
  ;;
esac
