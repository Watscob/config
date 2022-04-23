#!/bin/sh

nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk 'BEGIN {}
    $1 == 0  { print "" }
    $1 > 0 { print " ",""$1"%"}
    END {}'
