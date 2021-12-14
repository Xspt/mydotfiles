#!/bin/bash

monitor_veio=$(xrandr -q | grep VGA-0)
if [[ $monitor_veio == *connected* ]]; then
	xrandr --output HDMI-0 --primary --mode 1366x768 --rotate normal --output VGA-0 --mode 1280x720 --rotate normal --right-of HDMI-0
fi
