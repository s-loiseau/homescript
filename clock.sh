#!/usr/bin/env bash

pidfile="/tmp/.clockpid"

createclock() {
    urxvt -fn "xft:xos 4 terminus:regular:size=8" --geometry 40x10-5+5 --title "time" -e bash -c "tty-clock -cbBD" &
    pid=$!
    echo "$pid" > $pidfile
}
checkpid() {
    pid=$(cat $pidfile)
    kill $pid
    rm $pidfile
}

if [ -f $pidfile ];then
    checkpid
else
    createclock
fi
