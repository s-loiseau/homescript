#!/usr/bin/env bash

prefix="bat: "
prefix="vol: "

declare array messages

tput clear

messages[0]="░░░░░░░░░█"
messages[1]="░░░░░░░░█░"
messages[2]="░░░░░░░█░░"
messages[3]="░░░░░░█░░░"
messages[4]="░░░░░█░░░░"
messages[5]="░░░░█░░░░░"
messages[6]="░░░█░░░░░░"
messages[7]="░░█░░░░░░░"
messages[8]="░█░░░░░░░░"
messages[9]="█░░░░░░░░░"
empty="░░░░░░░░░░"

#messages=$prefix ${messages[9]}


create() {
    urxvt -fn "xft:xos 4 terminus:regular:size=20" \
        --geometry 15x3-5+5 \
        --title "time" \
        -e bash \
        -c "tput setaf 4;tput civis;echo $prefix ${messages[8]};sleep 2" &
}


create &
