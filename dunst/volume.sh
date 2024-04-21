#!/bin/bash

function send_notification {
	volume=$(pamixer --get-volume)
	icon="audio-volume-high"
	if [[ $volume -lt 33 ]]; then
		icon="audio-volume-low"
	elif [[ $volume -lt 66 ]]; then
		icon="audio-volume-medium"
	fi
	dunstify -t 1600 -h string:x-dunst-stack-tag:volume -u normal "Volume" -h int:value:"$volume" -i "$icon"
}

# Function to get the current audio output
function get_audio_output {
	output=$(pactl info | grep "Default Sink")
	echo "$output"
}

# Main script
case $1 in
up)
	# Increase the volume (+ 2%)
	pamixer -ui 2
	canberra-gtk-play -f /usr/share/sounds/ocean/stereo/audio-volume-change.oga
	send_notification
	;;
down)
	# Decrease the volume (- 2%)
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
get_output)
	# Get audio output
	get_audio_output
	;;
esac
