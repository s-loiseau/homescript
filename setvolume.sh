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
        dunstctl close
        notify-send "VOLUME UP $(getvolume)"
    else
        dunstctl close
        notify-send "VOLUME MAX $(getvolume)"
    fi
}

decrease() {
    if [ $(getvolume) -gt 0 ];then
        pamixer -d 10
        dunstctl close
        notify-send "VOLUME DOWN $(getvolume)"
    else
        dunstctl close
        notify-send "VOLUME MIN $(getvolume)"
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
