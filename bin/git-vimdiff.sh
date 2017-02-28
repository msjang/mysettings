#!/bin/bash
ANSI_RED="\033[01;31m"
ANSI2="\033[00m"
ANSI3="\033[01;30m"

echo -n -e ">> $ANSI_RED$1$ANSI2"

if [ $5 == "/dev/null" ]; then
	read -n 1 -s -p " (Deleted file, Press 's' to skip)"
	if [ x$REPLY == xs ]; then
		echo " --> Skiped"
	else
		echo " --> $2"
		vi "$2"
	fi

elif [ $2 == "/dev/null" ]; then
	read -n 1 -s -p " (NEW file, Press 's' to skip)"
	if [ x$REPLY == xs ]; then
		echo " --> Skiped"
	else
		echo " --> $5"
		vi "$5"
	fi

else
	read -n 1 -s -p " (Press any key to diff, Press 's' to skip)"
	if [ x$REPLY == xs ]; then
		echo " --> Skiped"
	else
		echo " --> "
		vimdiff "$5" "$2"
	fi

fi

