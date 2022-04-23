#!/bin/bash

OSDPIPE="$HOME/.cache/xob/backlight.fifo"
[[ -p "$OSDPIPE" ]] || mkfifo "$OSDPIPE" &>/dev/null

case "$1" in
    -u) brightnessctl --min-value=2 set "+$2%";;
    -d) brightnessctl --min-value=2 set "$2%-";;
    *) exit 1;;
esac

LEVEL=$(brightnessctl get)
MAX=$(brightnessctl max)
LEVEL_100=$(($LEVEL * 100 / $MAX))

printf "%.0f\n" "$LEVEL_100" > "$OSDPIPE"

exit 0
