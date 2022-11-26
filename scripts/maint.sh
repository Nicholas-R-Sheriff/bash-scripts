#!/bin/bash

# `maint`: Colorized bash script for apt-based systems package
# management and maintenance via APT.

# Beware of the `-y` option issued almost everywhere: this script
# will not ask for further permissions than eneterning your admin
# password when called.
# I STRONGLY SUGGEST TO REMOVE IT from `sudo apt autoremove` so
# that you can check what the PM is going to delete and have a
# choice to do so or not in order to be able to AVOID A SYSTEM
# BREAKEGE and cry after. Otherwise, leave it like it is if you
# feel really adventurous.

# Please, refer to Debian man-pages:
# - apt-get(8): https://manpages.debian.org/bullseye/apt/apt-get.8.en.html
# - apt(8):     https://manpages.debian.org/bullseye/apt/apt.8.en.html

# Please, place it in your $HOME/.local/bin directory, or in a
# subfolder thereof. In my opinion, it is where normal user's
# scripts should reside.

# Also, please remember to make it executable by changing dir.
# to wherever you placed the script and then by running:
# `sudo chmod +x maint.sh`,
# else you would be stuck in front of your terminal questioning
# your life, for a long time.

export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export purple="\033[1;35m"
export cyan="\033[1;36m"
export reset="\033[m"

echo -e "$cyan Updating packages sources & Fixing missing dependencies..."
sudo apt --fix-missing update -q -y

echo -e "$yellow Updating packages cache and checking for broken dependencies ..."
sudo apt-get check -y

echo -e "$yellow Searching for broken packages and reinstalling them..."
sudo apt install -fy

echo -e "$blue Upgrading packages..."
sudo apt upgrade -q -y

echo -e "$purple Cleaning up apt cache files..."
sudo apt autoclean -q -y
sudo apt clean -q -y

echo -e "$red Removing  Packages that are no more required..."
sudo apt autoremove -y

echo -e "$green All done."
exit 0
