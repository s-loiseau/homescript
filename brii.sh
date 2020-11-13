#!/usr/bin/env bash
# TODO:
# -[x] remove gnome-settings-daemon dependency


notif=true

value=${1:-90}
backlightdir="/sys/class/backlight/intel_backlight"
maxfile="$backlightdir"/max_brightness
brifile="$backlightdir"/brightness

currentbri=$(cat $brifile)
maxbri=$(cat  $maxfile)

newvalue=$(( $currentbri + $value ))

msg=""

if [ $newvalue -gt $maxbri ];then
    newvalue=$maxbri
fi

if [ $newvalue -lt 0 ];then
    newvalue=50
fi



currentbri=$(cat $brifile)
percent="$(( 100 * $currentbri / $maxbri ))"
msg=$(barman $percent)

if [ -n "$DISPLAY" ] ;then
    notify-send $msg
else
    echo $msg
fi

sudo tee $brifile <<< $newvalue > /dev/null
