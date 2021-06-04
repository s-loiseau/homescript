#!/usr/bin/env bash

locker.sh &

# require a swap partition
systemctl suspend
