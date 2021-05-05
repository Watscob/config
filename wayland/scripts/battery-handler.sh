#!/bin/bash

if [ -n "$(pgrep swaynag-battery)" ]; then
    echo "KILL"
    pkill swaynag-battery
fi
