#!/usr/bin/env bash
# GET BATTERY INFO AND PASS THEM TO POPUP

data=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 |\
    grep percentage|\
    awk '{print $2}' |\
    awk -F% '{print $1}')

state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state)
message="$(barman $data)"

if [ -n "$DISPLAY" ] ;then
    notify-send $message
else
    echo $message $data $state
fi
