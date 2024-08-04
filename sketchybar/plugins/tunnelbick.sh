#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

VPN_RUNNING=""
VPN_RUNNING=$(ps auxww | grep openvpn |grep -v grep)

if [[ $VPN_RUNNING == "" ]]; then
  ICON=""; COLOR=$WHITE
else
  ICON=􀤆; COLOR=$ORANGE
fi

sketchybar --set $NAME alias.color=$COLOR icon="$ICON" icon.color=$COLOR
