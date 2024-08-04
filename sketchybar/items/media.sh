
media=(
  icon.background.drawing=on
  icon.background.image=media.artwork
  icon.background.image.corner_radius=9
  script="$PLUGIN_DIR/media.sh"
  label.max_chars=15
  scroll_texts=on
  updates=on
)

sketchybar --add item media right \
           --set media "${media[@]}" \
                 background.color=$BACKGROUND_2 \
                 background.border_color=$TRANSPARENT \
                 background.border_width=3 \
                 background.height=38 \
           --subscribe media media_change
