#!/bin/sh

TMP_IMAGE=_swaylock.png
IMAGE=swaylock.png

grim /tmp/$TMP_IMAGE
ffmpeg -i /tmp/$TMP_IMAGE -filter_complex "gblur=sigma=30" /tmp/$IMAGE -y
