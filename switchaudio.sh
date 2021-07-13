#!/usr/bin/env bash

#pactl list sinks | egrep -i "state:|name:"
#pactl info | grep "Default Sink"
screen='alsa_output.pci-0000_08_00.1.hdmi-stereo-extra1'
screen_shortname="HDMI"
headphone='alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo'
headphone_shortname="HEADSET"

# Test indirect reference ${!ref}
#arg=$1
#case $arg in
#    screen|headphone)
#        echo "INDIRECT REF ${!arg}"
#        name="$arg"_shortname
#        echo "NAME  ${!name}"
#        ;;
#    *)
#        echo "UNKNOWN REFERENCE"
#        ;;
#esac


#

currentsink=$(pactl info | grep "Default Sink" | awk -F':' '{print $2}')

if [ $currentsink == "$screen" ];then
    pactl set-default-sink $headphone
    notify-send "SWITCH AUDIO TO $screen_shortname"
else
    pactl set-default-sink $screen
    notify-send "SWITCH AUDIO TO $headphone_shortname"
fi
