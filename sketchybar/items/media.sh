media=(
  icon.background.drawing=on
  icon.background.image=media.artwork
  icon.background.image.corner_radius=9
  icon.background.image.scale=0.6
  script="$PLUGIN_DIR/media.sh"
  label.max_chars=15
  label.padding_left=10
  scroll_texts=on
  updates=on
  position=center
  y_offset=-2
)

sketchybar --add item media center \
           --set media "${media[@]}" \
           --subscribe media media_change
