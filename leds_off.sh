#!/bin/bash

# check administrative privileges
if [ "$EUID" -ne "0" ]; then
	echo "You must be root to execute this script."
	exit 1
fi

for i in $(seq 0 1); do
	echo "Turning off system LED $i"
	echo 0 > /sys/class/leds/led${i}/brightness
done
