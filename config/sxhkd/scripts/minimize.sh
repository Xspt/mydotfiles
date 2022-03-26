#!/bin/sh

bspc query -N -n .window | while IFS= read -r wid
    do bspc node "$wid" -g hidden
done