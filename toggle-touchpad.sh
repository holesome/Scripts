#!/bin/sh

# Toggle touchpad status (enable/disable)
# Using libinput and xinput. This script depends on them.

# Original script: https://github.com/lahwaacz/Scripts/blob/master/toggle-touchpad.sh.
# Forked and modified by https://github.com/holesome to make the script POSIX compliant, which helps in portability and efficiency.
# The first grep command got also modified to make it simpler because the original script didn't work on my setup.

# Getting the name of the device. First list the devices with xinput list and then filter the result to only include the full name of the device.
device=`xinput list | grep -e '[A-Za-z0-9]\+.*TouchPad' -o`

# If it was enabled, disable it. And if it was disabled, enable it
[[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]] &&
    xinput disable "$device" ||
    xinput enable "$device"
