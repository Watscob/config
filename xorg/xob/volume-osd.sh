#!/bin/bash

OSDPIPE="$HOME/.cache/xob/volume.fifo"
[[ -p "$OSDPIPE" ]] || mkfifo "$OSDPIPE" &>/dev/null

case "$1" in
    -u) pamixer -i "$2";;
    -d) pamixer -d "$2";;
    -m) pamixer -t;;
    *) exit 1;;
esac

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)
[[ "$MUTED" = true ]] && MI="!"
echo "$VOLUME$MI" > "$OSDPIPE"

exit 0
