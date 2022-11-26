#!/bin/bash

# `maint`: Colorized bash script for apt-based systems
# package management and maintenance via APT.

# Beware of the `-y` option issued almost everywhere: this script will not ask for
# further permission than eneterning your administrative password once, when called.
# I STRONGLY SUGGEST TO REMOVE IT from `sudo apt autoremove` so you can check what 
# the system is going to delete and have choice to do so or not in order to be able to
# AVOID A SYSTEM BREAKEGE and cry after. Otherwise, leave it like it is if you feel 
# adventurous.

# Please, refer to Debian man-pages:
# - apt-get(8): https://manpages.debian.org/bullseye/apt/apt-get.8.en.html
# - apt(8):     https://manpages.debian.org/bullseye/apt/apt.8.en.html

# Please, place it in your $HOME/.local/bin directory, or in a subfolder
# thereof. In my opinion, it is where normal user's scripts should reside.

# Also, please remember to make it executable by running:
# `sudo chmod +x maintenance`,
# else you would be stuck in front of your terminal questioning your life,
# for a long time.

export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export blue="\033[1;34m"
export purple="\033[1;35m"
export cyan="\033[1;36m"
export grey="\033[0;37m"
export reset="\033[m"

echo "$cyan Updating packages sources & Fixing missing dependencies..."
sudo apt --fix-missing update -q -y

echo "$yellow Updating packages cache and checking for broken dependencies ..."
sudo apt-get check -y

echo "$yellow Searching for broken packages and reinstalling them..."
sudo apt install -fy

echo "$blue Upgrading packages..."
sudo apt upgrade -q -y

echo "$purple Cleaning up apt cache files..."
sudo apt autoclean -q -y
sudo apt clean -q -y

echo "$red Removing  Packages that are no more required..."
sudo apt autoremove -y

echo "$green All done."
exit 0
