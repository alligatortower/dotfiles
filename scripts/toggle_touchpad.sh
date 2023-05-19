#!/bin/bash
# TRACKPOINT_NAME="TPPS/2 Elan TrackPoint"
TOUCHPAD_NAME="SYNA8004:00 06CB:CD8B Touchpad"
# KEYBOARD_NAME="AT Translated Set 2 keyboard"
state=`xinput list-props "$TOUCHPAD_NAME" | ag "Device Enabled" | ag -o "[01]$"`

if [ "$state" = "1" ]; then
    # xinput --enable "$TRACKPOINT_NAME"
    # xinput --enable "$KEYBOARD_NAME"
    xinput --disable "$TOUCHPAD_NAME"
else
    # xinput --disable "$TRACKPOINT_NAME"
    # xinput --disable "$KEYBOARD_NAME"
    xinput --enable "$TOUCHPAD_NAME"
fi
