#!/usr/bin/env bash
# Author    :
# DATE      : 20 Oct 2017
# SCRIPTNAME: touchpadtoggle.sh

declare -i ID
ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    # echo "Touchpad disabled."
    message="Touchpad KILLED"
else
    xinput enable $ID
    # echo "Touchpad enabled."
    message="Touchpad KILLED"
fi

if [ -n "$DISPLAY" ] ;then
    notify-send $message
else
    echo $message
fi
