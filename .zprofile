# ~/.zprofile
if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    plymouth quit --retain-splash
    clear
    printf "\033c"
    
    # Lis le choix stocké par le script rofi
    SESSION_CHOICE=$(cat ~/.cache/session-choice 2>/dev/null || echo "hyprland")
    
    if [[ "$SESSION_CHOICE" == "plasma" ]]; then
        rm ~/.cache/session-choice
        exec startplasma-wayland
    else
        exec start-hyprland
    fi
fi
export MGFXC_WINE_PATH="/home/nico/.winemonogame"
