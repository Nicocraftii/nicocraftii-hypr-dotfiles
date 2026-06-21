#!/usr/bin/env bash
# This script refreshes the wallpaper on all connected monitors

# Define the path to your wallpaper
WALLPAPER_PATH="$HOME/Pictures/wallpapers/your_default_image.png"

# Preload the image to speed up the process
swww img "$WALLPAPER_PATH" --transition-type none --preload

# Get a list of all connected monitors and set the wallpaper on each
monitors=$(hyprctl monitors -j | jq -r '.[] | .name')
for monitor in $monitors; do
    swww img --outputs "$monitor" "$WALLPAPER_PATH"
done
