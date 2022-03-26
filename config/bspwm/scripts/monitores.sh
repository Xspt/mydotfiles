#!/bin/bash

old_monitor=$(xrandr -q | grep VGA-0)
tv=$(xrandr -q | grep HDMI-0)

if [[ $old_monitor == *connected* ]] && [[ $tv == *connected* ]]; then
	xrandr --output HDMI-0 --primary --mode 1366x768 --rotate normal --output VGA-0 --mode 1280x720 --rotate normal --below HDMI-0
else if [[ $old_monitor == *connected* ]]; then
	xrandr --output VGA-0 --mode 1280x720 --rotate normal
else if [[ $tv == *connected* ]]; then
	xrandr --output HDMI-0 --mode 1366x768 --rotate normal
fi
