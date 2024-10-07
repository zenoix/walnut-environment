#!/usr/bin/env sh

if pgrep hypridle > /dev/null; then
    killall hypridle;
    dunstify "Caffeine mode on";
else
    hyprctl dispatch exec hypridle > /dev/null;
    dunstify "Caffeine mode off";
fi
sleep 1.5
