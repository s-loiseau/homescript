#!/usr/bin/env bash
timeout=$1

for (( x=0; x < $timeout; x++ ));do
    remaining=$(( $timeout - $x ))
    notify-send "$remaining"
    sleep 60
done &

notify-send "TIMEOUT"
exit 0
