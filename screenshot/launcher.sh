#!/bin/bash

options="$HOME/.config/rofi/screenshot/options.txt"
scripts_dir="$HOME/.config/myshell/scripts"

chosen=$(cat $options | rofi -p "Screenshot menu" -dmenu -i)

if [ ! -z "$chosen" ] ; then
    action=$(echo $chosen | awk '{print $1}')
    name=$(echo $chosen | awk '{print $2}')
    sleep 1
    case $action in
        a*)
            $scripts_dir/area-screenshot $name ;;
        w*)
            $scripts_dir/window-screenshot $name ;;
        *)
            bash /$scripts_dir/full-screenshot $name ;;
    esac
fi


