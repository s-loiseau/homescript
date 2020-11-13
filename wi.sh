#!/usr/bin/env bash
checkip() {
    result=0
    while [ "$result" -eq 0 ];do
        sleep 0.5
        messager "."
        result=$(ip -br -4 addr show|grep -c wlp1s0)
    done
    echo
    messager "GOT IP"
}

rebootwifi() {
    messager "REINIT WIFI"
    sudo iwconfig wlp1s0 txpower off
    sudo iwconfig wlp1s0 txpower on
}

messager() {
    if [ -n "$DISPLAY" ];then
        notify-send "$@"
    else
        echo "$@"
    fi
}

result=""
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
        message='WIFI OFF'p
        sudo iwconfig wlp1s0 txpower off
        messager $message
        ;;
    "on")
        clear
        message='WIFI ON'
        sudo iwconfig wlp1s0 txpower on
        messager $message
        ;;
    "home")
        clear
        messager 'CONNECTING WIFI HOME'
        rebootwifi
        messager "INITIATE WIFI $action"
        sudo netctl start home
        if [ $? -eq 1 ]; then
            messager "ERROR"
            exit 1
        fi
        checkip
        ;;
    "spot")
        clear
        messager 'CONNECTING WIFI SPOT'
        rebootwifi
        messager "INITIATE WIFI $action"
        sudo netctl start wlp1s0-ECorp
        if [ $? -eq 1 ]; then
            messager "ERROR"
            exit 1
        fi
        checkip &
        ;;
    "*")
        exit 1
        ;;
esac
