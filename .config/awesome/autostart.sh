#!/usr/bin/env bash
set -euo pipefail

function run {
  if ! pgrep $1; then
    $@ &
  fi
}
#run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
run "nm-applet"
#run "caffeine"
# run "pamac-tray"
# run "blueman-applet"
#run "variety"
run "xfce4-power-manager"
run "blueberry-tray"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx on"
run "$HOME/.screenlayout/default.sh"
run "./scripts/external-keyboard.sh"
# run "volumeicon"

# killall -q polybar

# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# polybar left &
# polybar right &

run "emacs --daemon"
# run "nitrogen --restore"
# run "onedrive"
#you can set wallpapers in themes as well
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#run applications from startup
#run "firefox"
#run "dropbox"
#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"
