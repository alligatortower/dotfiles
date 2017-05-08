#!/bin/bash
device="SynPS/2 Synaptics TouchPad"
state=`xinput list-props "$device" | ag "Device Enabled" | ag -o "[01]$"`

if [ "$state" = "1" ]; then
    xinput --disable "$device"
else
    xinput --enable "$device"
	xinput set-prop "$device" "libinput Tapping Enabled" 1
fi
