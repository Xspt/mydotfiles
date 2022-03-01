#!/bin/bash

#nice multiple monitors launch script made by https://github.com/apetresc with some modifications

DIR=$(dirname "$BASH_SOURCE")

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
    for m in $(xrandr -q | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -q -r main -c "$DIR"/config.ini &
    done
else
    polybar -q -r main -c "$DIR"/config.ini &
fi