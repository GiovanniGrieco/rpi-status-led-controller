#!/bin/bash

set -e

# check administrative privileges
if [ "$EUID" -ne "0" ]; then
	echo "You must be root to execute this script."
	exit 1
fi

install -D -t /opt/services/status_led_controller/ ./leds_{on,off}.sh
install -t /etc/systemd/system/ ./status_led_controller.service

systemctl daemon-reload
systemctl enable --now status_led_controller > /dev/null
