#!/usr/bin/env bash

currdir=$(pwd)
scriptdir=$(dirname $0)
reporoot=$HOME
repolist=$(<$scriptdir/repolist)

gitcheck() {
    cd $reporoot/$1
    git fetch
    status=$(git status -bs)
    printf "\n>>> $x\n%s\n" "$status"
}

echo "--GIT CHECK--"
for x in $repolist;do
    gitcheck $x &
done
wait

cd $currdir
