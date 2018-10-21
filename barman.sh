#!/bin/bash

# INPUT a % value and make a ascii bar
# or currentvalue an max, $0 will calculate the percent

buildbar() {
    percent=$1
    icone=$(( percent / 10 ))
    reste=$(( 10 - icone ))

    if [ "$icone" -eq 0 ];then
        beg="|"
    else
        beg="$(printf "|%${icone}s" " " | sed 's/ /█/g')" 
    fi

    if [ "${reste}" -eq 0 ] ;then
        gin=""
    else
        gin="$(printf "%${reste}s|" " " | sed 's/ /░/g')"
    fi

    msg="$beg$gin"
    echo $msg
}

if [ ${#} -lt 1 ] ;then
    echo "Usage: $0 [percent]|[actual max]"
    exit
fi

if [ ${#} -eq 1 ] ;then
    percent=$1

fi

if [ ${#} -eq 2 ];then
    actual=$1
    max=$2
    percent=$(( 100 * $1 /$2 ))
    #echo $percent
fi

###
result=$(buildbar $percent)
echo "$result"
