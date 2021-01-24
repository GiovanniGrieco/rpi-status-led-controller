#!/bin/bash

set -e

# check administrative privileges
if [ "$EUID" -ne "0" ]; then
	echo "You must be root to execute this script."
	exit 1
fi

systemctl disable --now status_led_controller > /dev/null
systemctl daemon-reload

rm /etc/systemd/system/status_led_controller.service
rm -rf /opt/services/status_led_controller/
