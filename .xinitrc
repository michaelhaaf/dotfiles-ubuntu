#!/bin/bash

xset r rate 300 50
setxkbmap -option caps:escape
setxkbmap -option terminate:ctrl_alt_bksp
xrdb -load "$HOME/.Xresources" &
[[ -z "$(pgrep picom)" ]] && picom --experimental-backends --blur-method dual_kawase -b &
[[ -z "$(pgrep polybar)" ]] && "$HOME/.config/polybar/launch.sh" &
[[ -z "$(pgrep redshift)" ]] && exec redshift &
