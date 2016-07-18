#!/bin/bash
# NAME    : Tmux session builder
# COMMENT : tmux script to create a session with a few windows and panes
# AUTHOR  : S.LOISEAU
# CONTACT : 
# DATE    : 23 JUIN 2016
#
# USAGE   : ./tmuxbuild.sh [sessionname]


#session=$(echo $REMOTEHOST|cut -d. -f1)
session=$(echo $HOSTNAME|cut -d. -f1)
[ $1 ] && session=$1

testtmux=$(tmux ls | cut -d: -f1|grep -cw $session)

focusfirstpane () {
    tmux select-pane -t $session:.0
}

splitH () {
    tmux split-window -h -t $session:.
}

splitV () {
    tmux split-window -v -t $session:.
}

if [ $testtmux -gt 0 ];then
    # SESSION ALREADY EXIST attach and quit
    echo SESSION ALREADY THERE
    tmux attach -t $session
    exit
else
    # CREATE SESSION
    echo CREATE SESSION $session
    tmux -2 new-session -s $session -n HOME -d
fi

# window 1 HOME
[ -f GitCheck.sh ] && tmux send-keys -t $session:. 'GitCheck.sh' enter
##pane 1.1
splitH
##pane 1.2
splitV
focusfirstpane

# window 2 code
tmux new-window -n CODE
##pane 2.1
splitH
##pane 2.2
splitV
focusfirstpane

# window 3 projet
tmux new-window -n PROJETS
##pane 3.1
splitH
focusfirstpane

# Focus on first window
tmux select-window -t $session:1
focusfirstpane

tmux attach -t $session
