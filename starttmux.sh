#!/bin/bash
sn="BASE"
tmux -2 new-session -s $sn -n CODE -d
tmux split-window -h -t "$sn:1"
tmux split-window -v -t "$sn:1"
tmux new-window -t "$sn" -n NEXT
tmux attach -t "$sn"

