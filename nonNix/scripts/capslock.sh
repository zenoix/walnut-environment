#!/usr/bin/env bash

capslockStatus=$(cat /sys/class/leds/input*::capslock/brightness)

if [ "$capslockStatus" = 1 ]; then
  echo "CAPSLOCK ON" 
fi

exit 0
