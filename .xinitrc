#!/bin/bash

# TODO: don't think i need this font shit anymore
# rm /etc/fonts/conf.d/70-no-bitmaps.conf to get bitmap fonts to work!
# xset +fp /home/michael/.local/share/fonts/ &
# xset fp rehash &

xset r rate 300 50 &
setxkbmap -option caps:escape &
xrdb -load "$HOME/.Xresources" &
[[ -z "$(pgrep picom)" ]] && picom --experimental-backends --blur-method dual_kawase -b
[[ -z "$(pgrep polybar)" ]] && "$HOME/.config/polybar/launch.sh" & 
[[ -z "$(pgrep redshift)" ]] && exec redshift & 
