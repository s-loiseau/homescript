#!/usr/bin/env bash

. ~/scripts/.git-prompt.sh

currdir=$(pwd)
scriptdir=$(dirname $0)
reporoot=$HOME
repolist=$(<$scriptdir/repolist)

green='\e[32m'
red='\e[31m'
nc='\e[0m'

gitcheck() {
    cd $reporoot/$1
    git fetch
    changes=$(git status -bs)
    status2=$(__git_ps1)

    if [ $(echo "$changes" | wc -l) -eq 1 ];then
        color=${green}
    else
        color=${red}
    fi
    status="$status2"
    printf "\n>>> ${color}%-15s %10s${nc}\n$changes\n" $x "$status"
}

echo -e "\n\t--GIT CHECK--"
for x in $repolist;do
    gitcheck $x &
done
wait

cd $currdir

