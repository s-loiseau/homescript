#!/usr/bin/env bash
# SCRIPTNAME: getsub.sh

dir=~/Videos
listesub=$(find $dir -name "*.srt" -ctime 0)
echo "$listesub"
# video created today
liste=$(find $dir -name "*.mp4" -ctime 0)

echo "$liste"
#check if sub

for x in "$liste";do
    echo $x
    subliminal download -l en -l fr "$x"
done


listesub=$(find $dir -name "*.srt" -ctime 0)
echo "$listesub"


