#!/bin/bash

# Check if an external monitor is connected
if ! hyprctl monitors | grep -q "DP-[0-9]\|HDMI-[0-9]"; then
  # No external monitor, lock the screen
  hyprlock
else
  # External monitor connected, just turn off the laptop screen
  hyprctl keyword monitor "eDP-1,disable"
fi
