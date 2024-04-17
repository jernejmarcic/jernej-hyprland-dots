#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function is_mute {
	pamixer --get-mute
}

function send_notification {
	volume=$(pamixer --get-volume)
	dunstify -t 1600 -h string:x-dunst-stack-tag:volume -u normal "Volume" -h int:value:"$volume"
}

case $1 in
up)
	# Up the volume (+ 2%)
	pamixer -ui 2
	canberra-gtk-play -f /usr/share/sounds/ocean/stereo/audio-volume-change.oga
	send_notification
	;;
down)
	# Down the volume ( +2%)
	pamixer -d 2
	canberra-gtk-play -f /usr/share/sounds/ocean/stereo/audio-volume-change.oga
	send_notification
	;;
mute)
	# Toggle mute
	pamixer -t
	if is_mute; then
		dunstify -i audio-volume-muted -t 1900 -u normal "Mute"
	else
		send_notification
	fi
	;;
esac
