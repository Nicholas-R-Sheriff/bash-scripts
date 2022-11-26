#!/bin/bash

# `nala-maint`: Colorized bash script for apt-based systems
# package management and maintenance via NALA and APT.

# This was written for a Debian Sid system. NALA is in Debian
# Sid and Ubuntu Kinetic official repositories. If you run one
# of these or a distro based on them you can enjoy it by just
# installing it the classical way:
# `sudo apt install nala`.

# Beware of the `-y` option issued almost everywhere: this script
# will not ask for further permissions than eneterning your admin
# password when called.
# I STRONGLY SUGGEST TO REMOVE IT from `sudo apt autoremove` so
# that you can check what the PM is going to delete and have a
# choice to do so or not in order to be able to AVOID A SYSTEM
# BREAKAGE and cry after. Otherwise, leave it like it is if you
# feel really adventurous.

# Please, refer to Debian man-pages:
# - apt-get(8): https://manpages.debian.org/bullseye/apt/apt-get.8.en.html
# - apt(8):     https://manpages.debian.org/bullseye/apt/apt.8.en.html
# - nala(8):    https://manpages.debian.org/testing/nala/index.html

# Please, place it in your $HOME/.local/bin directory, or in a
# subfolder thereof. In my opinion, it is where normal user's
# scripts should reside.

# Also, please remember to make it executable by changing directory
# to wherever you placed the script and then by running:
# `sudo chmod +x nala-maint.sh`,
# else you would be stuck in front of your terminal questioning your
# life, for a long time.

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

echo "$yellow Updating packages cache and checking for broken dependencies..."
sudo apt-get check -y

echo "$yellow Searching for broken packages and reinstalling them..."
sudo nala install -fy

echo "$blue Upgrading packages..."
sudo nala upgrade -y

echo "$purple Cleaning up apt cache files..."
sudo apt autoclean -q -y
sudo nala clean

echo "$red Removing packages that are no more required..."
sudo nala autoremove -y

echo "$green All done."
exit 0
