#!/usr/bin/env bash

find `pwd` -name "*.py" -type f -not -name "install.sh" -exec ln -sf {} /usr/local/bin/ \;
find `pwd` -name "*.sh" -type f -not -name "install.sh" -exec ln -sf {} /usr/local/bin/ \;
