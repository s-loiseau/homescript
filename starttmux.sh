#!/usr/bin/env bash
# NAME    : Tmux session builder
# COMMENT : tmux script to create a session with a few windows and panes
# AUTHOR  : S.LOISEAU
# CONTACT :
# DATE    : 23 JUIN 2016
#
# USAGE   : ./tmuxbuild.sh [sessionname]


#session=$(echo $REMOTEHOST|cut -d. -f1)
source ~/.bashrc

session=$(echo $HOSTNAME|cut -d. -f1)
[ $1 ] && session=$1

testtmux=$(tmux ls 2>/dev/null | cut -d: -f1|grep -cw $session)

focusfirstpane () {
    tmux select-pane -t $session:.+1
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
    tmux -2 new-session -s $session -n TMUX -d
fi

# window 1 HOME
[ -f ~/tools/gitcheck.sh ] && tmux send-keys -t $session:. 'gitcheck.sh' enter
##pane 1.1
splitH
tmux send-keys -t $session:. 'archey3 -c black' enter
##pane 1.2
splitV
focusfirstpane

# window 2 code
#tmux new-window -n HOME
##pane 2.1
#splitH
##pane 2.2
#splitV
#focusfirstpane

# window 3 projet
#tmux new-window -n PROJETS
##pane 3.1
#splitH
#focusfirstpane

# Focus on first window
tmux select-window -t $session:1
#focusfirstpane

tmux attach -t $session
