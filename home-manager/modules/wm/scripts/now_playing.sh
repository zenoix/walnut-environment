#!/usr/bin/env bash
status=$(playerctl metadata --format "{{ status }}")

if [ "$status" = "Playing" ]; then
    playerctl --player=spotify metadata --format " {{artist}} - {{title}}"
fi
