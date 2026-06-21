#!/bin/bash

# Get current monitor status
if hyprctl monitors | grep -q "HDMI-A-1"; then
    # External monitor is connected
    if hyprctl monitors | grep -A 10 "HDMI-A-1" | grep -q "mirror"; then
        # Currently mirroring -> switch to extend
        hyprctl keyword monitor "HDMI-A-1, preferred, auto, 1"
        notify-send "Display Mode" "Extended Mode"
    else
        # Currently extended -> switch to mirror
        hyprctl keyword monitor "HDMI-A-1, preferred, 0x0, 1, mirror, eDP-1"
        notify-send "Display Mode" "Mirror Mode"
    fi
else
    # External monitor not connected - toggle presentation mode on laptop
    if hyprctl getoption monitor:eDP-1 | grep -q "scale: 1.5"; then
        hyprctl keyword monitor "eDP-1, preferred, auto, 1"
        notify-send "Display Mode" "Normal Mode"
    else
        hyprctl keyword monitor "eDP-1, preferred, auto, 1.5"
        notify-send "Display Mode" "Presentation Mode (Zoomed)"
    fi
fi
