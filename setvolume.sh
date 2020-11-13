#!/usr/bin/env bash
# control volume with pamixer
# and notify

getvolume() {
    # check current volume
    pamixer --get-volume
}

increase() {
    if [ $(getvolume) -lt 100 ];then
        pamixer -i 10
        notify-send "VOLUME UP"
    else
        notify-send "VOLUME MAX"
    fi
}

decrease() {
    if [ $(getvolume) -gt 0 ];then
        pamixer -d 10
        notify-send "VOLUME DOWN"
    else
        notify-send "VOLUME MIN"
    fi
}

mute() {
    pamixer -t && notify-send "MUTE TOGGLE $(pamixer --get-mute)"
}

usage() {
    $0 [increase | decrease | mute ]
    exit
}
main() {
    action="$1"
    if "$action" == "";then
        exit
    fi

    case $action in
        increase)
            increase
            ;;
        decrease)
            decrease
            ;;
        mute)
            mute
            ;;
        *)
            usage
            ;;
    esac

}

if [ ${BASH_SOURCE[0]} == $0 ];then
    main "$@"
fi
