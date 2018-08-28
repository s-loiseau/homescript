#!/usr/bin/env bash

cmd="transmission-remote -l"

quit() {
    clear
    exit
}

trap quit INT

clear
tput sc
while true;do
    tput rc
    $cmd
    # clear end of screen
    tput ed
    sleep 5
    clear
done





