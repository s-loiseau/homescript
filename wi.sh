#!/bin/bash
action=$1
red=$(tput setaf 1)
grn=$(tput setaf 2)
yel=$(tput setaf 3)
blu=$(tput setaf 4)
pur=$(tput setaf 5)
mag=$(tput setaf 6)
gre=$(tput setaf 7)
rst=$(tput sgr0)

case $action in
    "off")
        clear
        message='WIFI OFF'
        sudo iwconfig wlp1s0 txpower off
        #echo $red">>> WIFI OFF <<<<"$rst
        ;;
    "on")
        clear
        message='WIFI ON'
        sudo iwconfig wlp1s0 txpower on
        #echo $grn">>> WIFI ON <<<<"$rst
        ;;
    "home")
        clear
        message='WIFI HOME'
        sudo iwconfig wlp1s0 txpower off
        sudo iwconfig wlp1s0 txpower on
        sudo netctl start home
        ;;
    "spot")
        clear
        message='WIFI SPOT'
        sudo iwconfig wlp1s0 txpower off
        sudo iwconfig wlp1s0 txpower on
        sudo netctl start wlp1s0-ECorp
        ;;
    "*")
        exit 1
        ;;
esac

if pidof Xorg;then
    notify-send "$message"
else
    echo $message
fi
