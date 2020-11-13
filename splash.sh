#!/bin/bash

wallit() {
    message="$1"
    fg=$(tput setaf $2)
    bg=$(tput setab $3)
    font=$4
    rst=$(tput sgr0)
    echo $fg
    echo $bg
    echo
    echo -e "$message" | figlet -kcf $font
    echo $rst
}

wallit2() {
    message="$1"
    fg=$(tput setaf $2)
    bg=$(tput setab $3)
    font=$4
    rst=$(tput sgr0)
    echo -e "$fg$bg$message$rst"

}


wallit "$1" $2 $3 ${4:-slant}
