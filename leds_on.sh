#!/bin/bash

# check administrative privileges
if [ "$EUID" -ne "0" ]; then
	echo "You must be root to execute this script."
	exit 1
fi

KRNL_TRIGGERS=(mmc0 input)

for i in $(seq 0 1); do
	echo "Turning on system LED $i"
	echo 1 > /sys/class/leds/led${i}/brightness
    echo ${KRNL_TRIGGERS[$i]} > /sys/class/leds/led${i}/trigger
done
