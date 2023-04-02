#!/bin/bash

# check administrative privileges
if [ "$EUID" -ne "0" ]; then
	echo "You must be root to execute this script."
	exit 1
fi

echo 255 > /sys/class/leds/*/brightness
