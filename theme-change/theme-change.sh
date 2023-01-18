#!/usr/bin/env bash

# This is a script to change themes/colors of several programs.
# Relies on my `theme` script (github.com/anhsirk0/shell-config/blob/master/scripts/theme)

theme_script="$HOME/.config/myshell/scripts/theme"

theme=$($theme_script --list  | rofi -dmenu -p "Choose theme:")

if [[ -z "$theme" ]]; then
    exit
else
    $theme_script $theme
fi
