#!/bin/bash
 
str1="image"
str2="status"
str3="artist"
str4="song"

player="spotify"

status=$(playerctl -p $player status)
image=$(playerctl -p $player metadata | grep artUrl)
artist=$(playerctl -p $player metadata --format {{artist}})
song=$(playerctl -p $player metadata --format {{title}})


show_status(){

    if [ "$status" == "Playing" ]; then
        echo ""
    else
        echo "喇"
    fi

}

image_path(){

    IFS=' ' read -ra splitted <<< "$image"
    echo "${splitted[2]}"

}
 
if [ "$str1" == "$1" ]; then
    image_path

elif [ "$str2" == "$1" ]; then
    show_status

elif [ "$str3" == "$1" ]; then
    echo "$artist"

elif [ "$str4" == "$1" ]; then
    echo "$song"

else
    echo "penis"
fi