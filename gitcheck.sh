#!/bin/sh
currdir=$(pwd)
scriptdir=$(dirname $0)
reporoot=$HOME
repolist=$(<$scriptdir/repolist)

echo "GIT CHECK"
for x in $repolist;do
    echo -e "\n>>> $x"
    cd $reporoot/$x
    git status -bs
done
cd $currdir
