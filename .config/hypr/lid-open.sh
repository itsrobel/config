#!/bin/bash

hyprctl keyword monitor "eDP-1,preferred,auto,1.25"
if ! hyprctl monitors | grep -q "DP-[0-9]\|HDMI-[0-9]"; then
  hyprlock
fi
