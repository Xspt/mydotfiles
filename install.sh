#!/bin/bash

color1=`tput setaf 1`
color2=`tput setaf 2`
color3=`tput setaf 3`
color4=`tput setaf 4`
foreground=`tput setaf 7`

DIR=${pwd}
FDIR="$HOME/.local/share/fonts"
folders=("bspwm" "eww" "kitty" "neofetch" "picom" "polybar" "sxhkd" "wal")
BACKUPDIR="$HOME/dotfiles.old"

echo -e "\n${color3}[1] ${foreground}Creating backup folder at ${color4}$BACKUPDIR"
mkdir -p $BACKUPDIR
echo -e "${color2}...DONE\n"

echo -e "${color3}[2] ${foreground}Backuping your current dotfiles into ${color4}$BACKUPDIR"

for i in "${folders[@]}"
do
    if [ -d "$HOME/.config/$i" ]; then
        echo "${foreground}...Moving ${color1}$i ${foreground}dotfiles to ${color4}$BACKUPDIR"
        mv -f "$HOME/.config/$i" "$BACKUPDIR"
        echo -e "${color2}...DONE\n"

        echo "${foreground}...Installing ${color1}$i ${foreground}dotfiles"
        { mkdir -p "$HOME/.config/$i"; cp -rf $i/* "$HOME/.config/$i"; }
        echo -e "${color2}...DONE\n"
    else
        echo "${foreground}...Installing ${color1}$i ${foreground}dotfiles"
        { mkdir -p "$HOME/.config/$i"; cp -rf $i/* "$HOME/.config/$i"; }
        echo -e "${color2}...DONE\n"
    fi
done

echo -e "${color3}[3] ${foreground}Installing fonts into ${color4}$FDIR"
if [[ -d "$FDIR" ]]; then
	cp -rf fonts/* "$FDIR"
    fc-cache
    echo -e "${color2}...DONE\n"
else
	mkdir -p "$FDIR"
	cp -rf fonts/* "$FDIR"
    fc-cache
    echo -e "${color2}...DONE\n"
fi

echo "${foreground}"