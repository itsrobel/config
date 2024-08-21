#!/bin/bash

# Function to get the ID of the built-in keyboard
get_builtin_keyboard_id() {
  xinput list | grep -i "AT Translated Set 2 keyboard" | grep -o 'id=[0-9]*' | cut -d= -f2
}

# Function to check if an external keyboard is connected
is_external_keyboard_connected() {
  xinput list | grep -i "keyboard" | grep -v "AT Translated Set 2 keyboard" | grep -q .
}

# Function to disable the built-in keyboard
disable_builtin_keyboard() {
  local id=$(get_builtin_keyboard_id)
  xinput float $id
  echo "Built-in keyboard disabled"
}

# Function to enable the built-in keyboard
enable_builtin_keyboard() {
  local id=$(get_builtin_keyboard_id)
  xinput reattach $id 3
  echo "Built-in keyboard enabled"
}

# Main loop
while true; do
  if is_external_keyboard_connected; then
    disable_builtin_keyboard
  else
    enable_builtin_keyboard
  fi
  sleep 2
done
