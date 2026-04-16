#!/usr/bin/env bash
set -euo pipefail
# gifpaper setter
# simple utility for using 'mpvpaper' to spawn one of our lain animated wallpapers in navi
err_handler () {
  # simple error handler
  local err1="Oops! Something went wrong."
  local err2="Please see logs above and try again."
  echo "$err1"; sleep 1; echo "$err2"; sleep 1
  echo "Exiting in 3 seconds..."; sleep 3; exit
}
run_gifpaper () {
  # selects the gifpaper specified above and runs it as animated wallpaper
  # sends it to all detected displays for consistency
  local gifpaper="$HOME/wiredWM/wp/gifpaperslain/lain4.gif"
  mpvpaper ALL -o "loop panscan=1" "$gifpaper"
}
main () {
  # main func
  local t="gifpaper setter"; local ver="0.50"
  echo "$t - version $ver"; sleep 1
  echo "Setting animated wallpaper..."; sleep 1
  run_gifpaper
  echo "Done!"; sleep 1
  exit
}
# - - - entry
main || err_handler
# TODO add checks to make sure mpvpaper is actually built and installed
# run an installer and build script for it if not
