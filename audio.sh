#!/usr/bin/env bash

# TOGGLE AUDIO OUTPUT AND HDMI

hdmi="<output:hdmi-stereo-extra1+input:analog-stereo>"
speaker="<output:analog-stereo+input:analog-stereo>"
current=$(pacmd list-cards | grep "active profile:")
status_hdmi=$(echo $current | grep -cw "$hdmi")
status_speaker=$(echo $current | grep -cw "$speaker")


if [ $status_hdmi -eq 1 ];then
    # TURN OFF HDMI VIDEO OUTPUT
    xrandr --output HDMI-2 --off
    # SWITCH TO SPEAKER
    pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
    message='SPEAKER'
elif [ $status_speaker -eq 1 ]; then
    # TURN ON HDMI VIDEO OUTPUT
    xrandr --output HDMI-2 --auto
    # SWITCH TO HDMI AUDIO
    pactl set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo
    message='HDMI'
fi

if [ -n "$DISPLAY" ] ;then
    notify-send $message
else
    echo $message
fi
