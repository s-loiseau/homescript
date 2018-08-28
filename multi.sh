#!/usr/bin/env bash
# Author    : 
# DATE      : 15 Jan 2018
# SCRIPTNAME: multi.sh


function create_data {
    figlet "MULTI GRAVITE EXTREME" | lolcat
    for ((x=0;x<18;x++));do
        myx=$( shuf -i 2-9 -n 1)
        myy=$( shuf -i 2-9 -n 1)
        echo "$x : $myx x $myy = $(( myx * myy ))" > resultat.txt
        echo "$x : $myx x $myy = ???"

    done | column -t
}

function timer {
    for ((x=0;x<=60;x++));do
        sleep 1
        tput cup 15 45
        echo $x
    done
    tput rc
}
clear
create_data
tput sc
timer
figlet "TIMEOUT" | lolcat
