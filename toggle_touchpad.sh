#!/bin/bash
device="SYNA8004:00 06CB:CD8B Touchpad"
state=`xinput list-props "$device" | ag "Device Enabled" | ag -o "[01]$"`

if [ "$state" = "1" ]; then
    xinput --disable "$device"
else
    xinput --enable "$device"
fi
