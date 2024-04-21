# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function is_mute {
	pamixer --default-source --get-mute
}

function send_notification {
	volume=$(pamixer --default-source --get-volume)
	dunstify -i "/usr/share/icons/Papirus/22x22/panel/audio-input-microphone-high.svg" -t 1600 -h string:x-dunst-stack-tag:volume -u normal "Microphone volume" -h int:value:"$volume"
}

case $1 in
up)
	# Set the volume on (if it was muted)
	# Up the volume (+ 2%)
	pamixer --default-source -ui 2
	send_notification
	;;
down)
	# Down the volume ( +2%)
	pamixer --default-source -d 2
	send_notification
	;;
mute)
	# Toggle mute
	pamixer --default-source -t
	if is_mute; then
		dunstify -i "/usr/share/icons/Papirus-Light/22x22/panel/audio-input-microphone-muted.svg" -t 1900 -u normal "Microphone Mute"
	else
		send_notification
	fi
	;;
esac
