#!/usr/bin/env bash
set -euo pipefail
# build/install script for navi
# installs our fork of mpvpaper for animated wallpapers (aka 'gifpapers')
# NOTE currently assumes a debian 13+/ubuntu 26.04+ working environment
err_handler () {
	# simple error handler
	local err1="Oops! Something went wrong.\nPlease check the logs and try again."
	echo "$err1"; sleep 1
	echo "Exiting in 3 seconds..."; sleep 3 && exit
}
clone_build_mpvpaper () {
	 # clones and builds our mpvpaper fork repo, then installs it
	 local repo_link="https://github.com/rav3ndust/mpvpaper"
	 local pkgs="meson"
 	 doas apt update && doas apt install $pkgs -y
	 # clone step
  	 git clone $repo_link
  	 cd mpvpaper
	 # build step
	 local pre="/usr/local"; meson setup build --prefix="$pre"
	 ninja -C build
	 # install step
	 ninja -C build install
}
run_gifpaper_setter () {
	# runs the gifpaper_setter script we wrote for setting an animated wallpaper
	local script="gifpaper-setter.sh"
	echo "Setting animated wallpaper..."; sleep 1
	bash $script
}
main () {
	local t="mpvpaper build and install script"
  	local ver="0.10"
 	echo "$t - version $ver"; sleep 1
  	echo "Ensuring all needed packages are installed..."; sleep 1
  	install_needed_pkgs
  	echo "Cloning, building, and installing mpvpaper..."; sleep 1
  	clone_build_mpvpaper	# build and install
	run_gifpaper_setter	# set ani wp
	echo "Done! You should now see your animated wallpaper."; sleep 1
	echo "Exiting the script..."; sleep 3 && exit
}
# - - - entry
main || err_handler
