#!/usr/bin/env bash

# TODO
# - [ ] control message size and accord terminal size

popup() {
    message="$*"
    urxvt -fn "xft:xos 4 terminus:regular:size=18" \
        --geometry 13x3-5+5 \
        --title "time" \
        -e bash -c "tput setaf 4;tput civis;echo; echo \"$message\" ;sleep 1" &
}

# SAVE WINDOW ID
#currentwindow=$(xdotool getactivewindow)
#currentwindow=$(cat /tmp/activewin)

# FOCUS STOLEN
popup "$@" &

# FOCUS BACK
#xdotool windowfocus $currentwindow
