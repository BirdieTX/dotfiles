# ------------------------------------------------------
# Diagnosis
# ------------------------------------------------------
_writeLogHeader "Diagnosis"

_run_diagnosis(){
    _commandExists "rofi" "rofi-wayland"
    _commandExists "dunst" "dunst"
    _commandExists "waybar" "waybar"
    _commandExists "hyprpaper" "hyprpaper"
    _commandExists "hyprlock" "hyprlock"
    _commandExists "hypridle" "hypridle"
    _commandExists "hyprshade" "hyprshade"
    _commandExists "wal" "python-pywal"
    _commandExists "gum" "gum"
    _commandExists "wlogout" "wlogout"
    _commandExists "ags" "ags"
    _commandExists "magick" "imagemagick"
    _commandExists "waypaper" "waypaper"
}

if [[ $(_check_update) == "false" ]] ;then
    _writeHeader "Diagnosis"
    if [ -z $automation_diagnosis ] ;then
        _writeMessage "The system check will test that essential packages and execution commands are available now on your system."
        echo 
        if gum confirm "Do you want to run a short system check?" ;then
            _run_diagnosis
            echo
            if gum confirm "Do you want to proceed?" ;then
                echo
            elif [ $? -eq 130 ]; then
                _writeLogTerminal 0 "Installation canceled"
                exit 130
            else
                _writeLogTerminal 0 "Installation canceled"
                exit
            fi
        elif [ $? -eq 130 ]; then
            exit 130
        else
            _writeLogTerminal 0 "Diagnosis skipped"
        fi
    else
        if [[ "$automation_diagnosis" = true ]] ;then
            _run_diagnosis
        fi
    fi
    echo
fi