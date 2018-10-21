#!/usr/bin/env bash
# Display a text char by char, with pauses on punctuation.

readit() {
    text=$(cat $1)
    length=${#text}
    clear
    echo

    tput setaf 2
    for ((x=0;x < $length ; x++));do
        #[ "$pid" ] && kill -9 $pid > /dev/null 2>&1
        echo -en "${text:$x:1}"

        char="${text:$x:1}"
        delay=0.03

        case "$char" in
            " ")
                delay=0.06
                ;;
            ",")
                delay=0.04
                ;;
            ".")
                delay=0.3
                nextchar=$(( $x + 1 ))
                if [ "${text:$nextchar:1}" = '.' ];then
                    delay=0.06
                fi
                ;;
            "!")
                delay=0.7
                ;;
            "\n")
                delay=2
                ;;
        esac

        sleep $delay
    done
    tput sgr0

    read a
    clear

}

if [ "${BASH_SOURCE[0]}" = "$0" ];then

    file="$1"
    if [ -z "$file" ];then
        echo ERROR
        exit 1
    fi

    for x in $@;do
        readit $x
    done
fi
