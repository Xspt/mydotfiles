#!/bin/bash

volume="$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%')"
is_muted="$(amixer -D pulse sget Master | grep 'Left:' | awk '{ print $6 }' | tr -d '[]')"

if [ "$1" = "volume" ]; then
    echo $volume
elif [ "$1" = "muted" ]; then
    if [ $is_muted = "on" ]; then
        echo "ﰝ"
    elif [ $is_muted = "off" ]; then
        echo "遼"
    fi
fi