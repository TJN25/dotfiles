#!/bin/bash

update_media() {
  STATE="$(echo "$INFO" | jq -r '.state')"

  if [ "$STATE" = "playing" ]; then
    APP=$(echo "$INFO" | jq -r '.app')
    MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
    sketchybar --set $NAME label="$MEDIA" drawing=on \
                           # background.border_color=$TRANSPARENT \
                           scroll_texts=on
  else
    sketchybar --set $NAME drawing=off \
                           background.border_color=$TRANSPARENT \
                           scroll_texts=off
  fi
}

case "$SENDER" in
  "media_change") update_media
  ;;
esac
