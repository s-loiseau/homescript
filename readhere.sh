#!/usr/bin/env bash
video="$1"

wininfo=$(xwininfo -id $(xdotool getactivewindow))
cx=$(echo "$wininfo"| grep "Absolute upper-left X" | awk '{print $NF}')
cy=$(echo "$wininfo"| grep "Absolute upper-left Y" | awk '{print $NF}')
w=$(echo "$wininfo"| grep "Width" | awk '{print $NF}')
h=$(echo "$wininfo"| grep "Height" |awk '{print $NF}')

geometry="-geometry ${w}x${h}+${cx}+${cy}"
#echo $geometry


if [ ${BASH_SOURCE[0]} == $0 ];then
    mpv $geometry --really-quiet "$video"
else
    mpv $geometry --really-quiet "$video"
fi


