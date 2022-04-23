#!/bin/bash

BARS=(volume backlight)
CACHE_DIR="$HOME/.cache/xob"

mkdir "$CACHE_DIR" &> /dev/null

for bar in "${BARS[@]}"; do
    OSDPIPE="$CACHE_DIR/$bar.fifo"
    [[ -p "$OSDPIPE" ]] || mkfifo "$OSDPIPE" &> /dev/null

    (tail -f "$OSDPIPE" | xob -s "$bar")&
done

exit 0
