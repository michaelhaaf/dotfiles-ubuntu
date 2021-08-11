#!/bin/bash
exec bspwm
exec redshift
xset +fp /home/michael/.local/share/fonts
xset fp rehash
xset r rate 300 50
xmodmap .xmodmap
