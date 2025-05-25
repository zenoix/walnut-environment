#!/usr/bin/env sh

if pgrep hypridle > /dev/null; then
    killall hypridle;
    dunstify "Hypridle" "Caffeine mode on" -t 1250;
else
    hyprctl dispatch exec hypridle > /dev/null;
    dunstify "Hypridle" "Caffeine mode off" -t 1250;
fi
sleep 1.5
