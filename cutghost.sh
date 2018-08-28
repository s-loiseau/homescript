#!/usr/bin/env bash
# Author    : 
# DATE      : 13 Jan 2018
# SCRIPTNAME: cutghost.sh

url="https://www.youtube.com/watch?v=KN4hQKJ7jsU"
file="ghostfull.mp4"

ffmpeg -ss 00:17:00 -i $file -ss 00:00:50.250 -to 00:00:54.900 -acodec copy -vcodec libx264 output.mp4
mpv output.mp4
