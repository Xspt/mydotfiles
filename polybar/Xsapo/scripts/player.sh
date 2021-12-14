#!/bin/bash

widgets=$(eww windows)
echo $widgets

close='*player'

if [[ "$widgets" == *"$close"* ]]; then
    eww close player
    echo "fechemo"
else
    eww open player
    echo "abrimo"
fi
