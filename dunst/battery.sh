#!/bin/bash

set_icon_and_color() {
	local battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
	local battery_status=$(cat /sys/class/power_supply/BAT0/status)

	local rounded_battery_percent=$(((battery_percent + 5) / 10 * 10))

	if [ "$battery_status" = "Full" ]; then
		icon="/usr/share/icons/Papirus-Dark/symbolic/status/battery-level-100-symbolic.svg"
	elif [ "$battery_status" = "Charging" ]; then
		icon="/usr/share/icons/Papirus-Dark/symbolic/status/battery-level-$rounded_battery_percent-charging-symbolic.svg"
	else
		icon="/usr/share/icons/Papirus-Dark/symbolic/status/battery-level-$rounded_battery_percent-symbolic.svg"
	fi

	if [ "$battery_percent" -ge 50 ]; then
		color="#69F0AE" # Green
	else
		color="#FF5252" # Red
	fi

	# Use the icon and color in dunstify command
	#	dunstify -i "$icon" -t 1600 -h string:x-dunst-stack-tag:battery -u normal "Battery charge: $battery_percent%" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"

}

battery_warning() {
	set_icon_and_color
	local battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
	local battery_status=$(cat /sys/class/power_supply/BAT0/status)
	local battery_warning=""

	# Check battery percentage for warnings
	if [ "$battery_percent" -eq 5 ]; then
		battery_warning="Battery is critically low $battery_percent%"
		dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u $urgency "Battery $battery_status" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"
		urgency="critical"
	elif [ "$battery_percent" -eq 10 ]; then
		battery_warning="Battery is very low $battery_percent"
		dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u $urgency "Battery $battery_status" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"
		urgency="critical"
	elif [ "$battery_percent" -eq 20 ]; then
		battery_warning="Battery is low $battery_percent"
		urgency="critical"
		dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u $urgency "Battery $battery_status" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"
	elif [ "$battery_percent" -eq 30 ]; then
		battery_warning="Battery is getting low $battery_percent"
		urgency="normal"
		dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u $urgency "Battery $battery_status" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"
	elif [ "$battery_percent" -ge 78 ] && [ "$battery_status" = "Not charging" ]; then
		battery_warning="Battery stoped charging at $battery_percent to preserve health"
		urgency="normal"
		dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u $urgency "Battery $battery_status" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"
	fi

	if [ "$battery_status" != "$previous_status" ]; then

		if [ "$battery_status" = "Discharging" ]; then
			color="#FF5252" # Red
		else
			color="#69F0AE" #Green
		fi

		dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u normal "Battery $battery_status" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"
		previous_status="$battery_status"
	fi

	#	dunstify -i $icon -t 1600 -h string:x-dunst-stack-tag:battery -u normal "$battery_warning" -h string:bgcolor:"#263238" -h string:fgcolor:"$color" -h string:hlcolor:"$color" -h int:value:"$battery_percent" -h string:percentage:"#69F0AE"

}

while true; do
	battery_warning
	sleep 5
done
