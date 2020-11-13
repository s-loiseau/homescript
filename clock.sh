#!/usr/bin/env bash

pidfile="/tmp/.clockpid"

createclock() {
    currentid=$(xdotool getactivewindow)
    urxvt -letsp 2 \
          -fn "xft:scientifica:regular:size=8" \
          --geometry 40x10-25+15 \
          --title "time" \
          -e bash \
          -c "tty-clock -cbBD" &
    pid=$!
    echo "$pid" > $pidfile
    xdotool windowfocus $currentid
}

checkpid() {
    if [ -f $pidfile ];then
        pid=$(cat $pidfile)
        kill $pid
        rm $pidfile
        exit 0
    fi
}

checkpid
createclock
