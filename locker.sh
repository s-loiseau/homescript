#!/usr/bin/env bash
# to avoid transparancy issue with compton add below lines in compton.conf
# mark-ovredir-focused = true;
scriptdir=$(basename $(dirname $0))
scriptname=$(basename $0)

#logodir=$scriptdir/png
logodir=~/Pictures/png
logo=$1
logosize=720
# if logo is empty select a random image
if [ -z "$logo" ];then
    logo=$(find $logodir -type f -name "*.png" | shuf -n 1)
else
    logo=$logodir/$logo
fi

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% -colorspace Gray /tmp/screen.png
convert /tmp/screen.png -colorspace sRGB /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% -monochrome /tmp/screen.png

if [ -f $logo ];then
    convert $logo -resize $logosize /tmp/slogo.png
    convert /tmp/screen.png /tmp/slogo.png -gravity center -composite -matte /tmp/screen.png
fi > /dev/null

# -n disable background run
# and allow to run action after unclock
i3lock -n -u -i /tmp/screen.png

# cleanup
[ -f /tmp/screen.png ] && rm /tmp/screen.png
[ -f /tmp/slogo.png ] && rm /tmp/slogo.png
