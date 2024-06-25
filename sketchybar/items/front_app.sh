#!/bin/bash

#Filename: ~/github/dotfiles-latest/sketchybar/felixkratz/items/front_app.sh

front_app=(
	label.padding_left=4
  y_offset=-2
	# Using "MesloLGM Nerd Font"
	label.font="$FONT:Bold:12.0"
	# Using default "SF Pro"
	# label.font="$FONT:Black:13.0"
	icon.background.drawing=on
  icon.background.image.scale=0.6
  icon.align=center
	display=active
	script="$PLUGIN_DIR/front_app.sh"
	click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left \
	--set front_app "${front_app[@]}" \
	--subscribe front_app front_app_switched
