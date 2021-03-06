#!/bin/bash
function removeDownloadDirectory() {
	rm -rf $SCRIPT_PATH
}

function sayEnd() {
	logSuccess "Initialization of the system has been completed. "
	echo -e "Do you want to \e[0;31m\033[1mreboot\e[m system now? [Y/N]: "
	read REPLY
	case $REPLY in
	Y | y)
		echo "The system will reboot now ..."
		reboot
		;;
	N | n)
		echo "You must reboot later..."
		source /etc/profile
		;;
	*)
		echo "The system will reboot now ..."
		reboot
		;;
	esac
}

function main() {
	removeDownloadDirectory
	sayEnd
	exit 0
}

main
