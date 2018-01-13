#!/usr/bin/env bash
# TODO:
# -[x] remove gnome-settings-daemon dependency


notif=false

value=${1:-90}
backlightdir="/sys/class/backlight/intel_backlight"
maxfile="$backlightdir"/max_brightness
brifile="$backlightdir"/brightness

currentbri=$(cat $brifile)
maxbri=$(cat  $maxfile)

newvalue=$(( $currentbri + $value ))

msg=""

if [ $value -lt 0 ];then
    msg="brightness down $newvalue"
fi

if [ $value -gt 0 ];then
    msg="brightness up $newvalue"
fi

if [ $newvalue -gt $maxbri ];then
    msg="brightness MAX"
    newvalue=$maxbri
fi

if [ $newvalue -lt 0 ];then
    msg="brightness MIN"
    newvalue=50
fi


if [[ $notif == 'true' ]];then
    notify-send "$msg"
fi

sudo tee $brifile <<< $newvalue > /dev/null
