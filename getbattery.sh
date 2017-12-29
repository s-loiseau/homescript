#!/usr/bin/env bash

data=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)
timeb=$(echo "$data" | awk -F: '/time to empty/ {print $2}')
percent=$(echo "$data" | awk -F: '/percent/ {print $2}')
percent=$(echo "$percent" | sed 's/^\s\+//')
timeb=$(echo "$timeb" | sed 's/^\s\+//')

notify-send "BATTERY: $percent $timeb"
