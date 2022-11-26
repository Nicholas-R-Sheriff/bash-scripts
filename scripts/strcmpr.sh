#!/bin/bash

# `strcmpr`: Compare strings in bash; Compare strings in Linux terminal. 
# `strcmpr` is a stupid-simple command-line and colorized bash script
# that asks the user to enter two both character or numerical strings.

# Please, place it in your $HOME/.local/bin directory, or in a subfolder
# thereof. In my opinion, it is where normal user's scripts should reside.
# Also, please remember to make it executable by running:
# `sudo chmod +x maintenance`,
# else you would be stuck in front of your terminal questioning your life,
# for a long time.

# Trivially, based on what you type, outputs the following answers

# - "Strings are equal.", in green, if strings successfully and precisely match to each other;
# - "String 1 contains string 2.", in yellow, if the second input string partially matchees with the first one;
# - "String 2 contains string 1.", in cyan, if the first input string partially matches with the second one;
# - "String 1 is empty!", in purple, if user forgot to enter anything in the first call;
# - "String 2 is empty!", in purple, if user forgot to enter anything in the second call;
# - "Strings are different.", in, if strings does not match.

## Have fun.

export red="\033[1;31m"
export green="\033[1;32m"
export yellow="\033[1;33m"
export purple="\033[1;35m"
export cyan="\033[1;36m"
export reset="\033[m"

read -p "Please, enter string 1: " VAR1
read -p "Please, enter string 2: " VAR2

if [[ "$VAR1" == "$VAR2" ]]; then
	echo -e "$green Strings are equal."
elif [[ "$VAR1" =~ .*$VAR2.* ]]; then
	echo -e "$yellow String 1 contains string 2."
elif [[ "$VAR2" =~ .*$VAR1.* ]]; then
	echo -e "$cyan String 2 contains string 1."
elif [[ -z "$VAR1"  ]];	then
	echo -e "$purple String 1 is empty!"
elif [[ -z "$VAR2"  ]];	then
	echo -e "$purple String 2 is empty!"
else
   echo -e "$red Strings are different."
fi
