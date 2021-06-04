#!/usr/bin/env bash
channel=${1:-220}
mpv --really-quiet --untimed --rtsp-transport=udp "rtsp://mafreebox.freebox.fr/fbxtv_pub/stream?namespace=1&service=${channel}" &
