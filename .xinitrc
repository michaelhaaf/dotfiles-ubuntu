#!/bin/bash
# rm /etc/fonts/conf.d/70-no-bitmaps.conf to get bitmap fonts to work!
xset +fp /home/michael/.local/share/fonts/
xset fp rehash
xset r rate 300 50
setxkbmap -option caps:escape

exec redshift & 
