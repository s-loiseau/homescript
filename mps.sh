#!/usr/bin/env bash

pidfile="/tmp/.mpsytpid"

createclock() {
    urxvt -fn "xft:xos 4 terminus:regular:size=13" --title "FOO" -e bash -c "mpsyt" &
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
