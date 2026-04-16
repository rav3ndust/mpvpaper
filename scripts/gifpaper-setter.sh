#!/usr/bin/env bash
# gifpaper setter
# simple utility for using 'mpvpaper' to spawn one of our lain animated wallpapers in navi
t="gifpaper setter"; ver="0.50"
gifpaper="$HOME/wiredWM/wp/gifpaperslain/lain4.gif"
# funcs
err_handler () {
  # simple error handler
  local err1="Oops! Something went wrong."
  local err2="Pleas see logs above and try again."
  echo "$err1"; sleep 1; echo "$err2"; sleep 1
  echo "Exiting in 3 seconds..."; sleep 3; exit
}
run_gifpaper () {
  # selects the gifpaper specified above and runs it as animated wallpaper
  mpvpaper ALL -o "loop panscan=1" "$gifpaper"
}
main () {
  # main func
  echo "$t - version $ver"; sleep 1
  echo "Setting animated wallpaper..."; sleep 1
  run_gifpaper
  echo "Done!"; sleep 1
  exit
}
# - - - entry
main || err_handler
