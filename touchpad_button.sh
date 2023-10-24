#!/bin/bash

a=($(xinput list-props 'ELAN1200:00 04F3:309F Touchpad' | grep -E 'Device Enabled|Disable While Typing Enabled' | grep -oE '[0-9]+' | tr '\n' ' '))

enabled=${a[1]}
disable_typing_id=${a[2]}
disable_typing=${a[3]}

if [ "$1" == "none" ]; then
	if [ "$enabled" == "0" ]; then
		xinput enable 'ELAN1200:00 04F3:309F Touchpad'
		notify-send -t 5000 "Touchpad enabled"
		disable_typing=1
	fi
	if [ "$disable_typing" == "1" ]; then
		xinput set-prop 'ELAN1200:00 04F3:309F Touchpad' $disable_typing_id 0
		notify-send -t 5000 "Touchpad gaming mode enabled!"
	else
		xinput set-prop 'ELAN1200:00 04F3:309F Touchpad' $disable_typing_id 1
		notify-send -t 5000 "Touchpad gaming mode disabled!"
	fi
elif [ "$1" == "shift" ]; then
	if [ "$enabled" == "1" ]; then
		xinput disable 'ELAN1200:00 04F3:309F Touchpad'
		notify-send -t 5000 "Touchpad disabled"
	else
		xinput enable 'ELAN1200:00 04F3:309F Touchpad'
		notify-send -t 5000 "Touchpad enabled"
	fi
fi
