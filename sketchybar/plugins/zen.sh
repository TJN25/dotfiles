#!/bin/bash


SPACE_ICONS=($(aerospace list-workspaces --all))

sid=0
update_spaces() {
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  space=${SPACE_ICONS[$i]}
  sketchybar --set space.$space drawing="$1"
done
}

zen_on() {
  sketchybar --set wifi drawing=off \
             --set battery label.drawing=off \
             --set calendar icon.drawing=off \
             --set calendar label.padding_left=15 \
             --set separator drawing=off \
             --set space_creator drawing=off \
             --set front_app label.drawing=off \
             --set volume_icon drawing=off \
             --set media drawing=off \
             --set volume drawing=off \
             --set cpu.top drawing=off \
             --set cpu.percent drawing=off \
             --set cpu.sys drawing=off \
             --set cpu.user drawing=off \
             --set apple drawing=off \
             --set vnc drawing=off \
             --set Slack drawing=off \
             --set "Tunnelblick" drawing=off 
  update_spaces "off"
}

zen_off() {
  sketchybar --set wifi drawing=on \
             --set calendar icon.drawing=on \
             --set battery label.drawing=on \
             --set calendar label.padding_left=0 \
             --set space_creator drawing=on \
             --set separator drawing=on \
             --set front_app label.drawing=on \
             --set media drawing=on \
             --set space.label drawing=on \
             --set volume_icon drawing=on \
             --set volume drawing=on \
             --set cpu.percent drawing=on \
             --set cpu.sys drawing=on \
             --set cpu.user drawing=on \
             --set cpu.top drawing=on \
             --set apple drawing=on \
             --set Slack drawing=on \
             --set vnc drawing=on \
             --set "Tunnelblick" drawing=on
  update_spaces "on"
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query volume | jq -r ".geometry.drawing")" = "on" ]; then
    zen_on
  else
    zen_off
  fi
fi


