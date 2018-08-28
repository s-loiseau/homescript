#!/usr/bin/env bash
_current_dir=$(dirname $(basename $0))

vol=$(pamixer --get-volume)
vol=$(printf "%${vol}s" " " | tr " " "X")
urxvt -e bash -c "echo $vol" &
sleep 1
exit
