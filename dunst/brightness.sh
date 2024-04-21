#!/bin/sh
# You can call this script like this:
# $ ./brightness.sh up
# $ ./brightness.sh down

send_notification() {
	brightness=$(light | grep -oE '^[0-9]+')

	# Send the notification with the determined icon
	dunstify -t 1600 -h string:x-dunst-stack-tag:brightness -u normal "Brightness $brightness%" -h int:value:"$brightness"
}

case $1 in
up)
	brightnessctl -d nvidia_wmi_ec_backlight s +2%
	send_notification
	;;
down)
	brightnessctl -d nvidia_wmi_ec_backlight s 2%-
	send_notification
	;;
esac
