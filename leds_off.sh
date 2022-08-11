#!/bin/bash

# check administrative privileges
if [ "$EUID" -ne "0" ]; then
	echo "You must be root to execute this script."
	exit 1
fi

function power_off
{
	echo 0 | tee /sys/class/leds/led*/brightness > /dev/null
}

power_off
sleep 1
power_off
sleep 1
power_off

