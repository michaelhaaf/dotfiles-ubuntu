#!/bin/bash
# inspired by https://dev.to/mafflerbach/theme-switcher-based-on-rofi-and-pywal-4128

# grab the purest color definition file
input="/home/michael/.cache/wal/colors"
i=0
content=""
while IFS= read -r line
do

    # generate the color list for my style config
    if [ $i -eq 0 ]; then 
        content="${content}  background:${line}00;"
        content="${content}  color$i:${line};"
    else 
        content="${content}  color$i:${line};"
    fi

    ((i++))

done < "$input"

# copied a template config to the actual config location
walTemplate="${HOME}/Repositories/dotfiles/.config/wal/templates/colors-rofi-template.rasi"
walTheme="${HOME}/Repositories/dotfiles/.config/wal/templates/colors-rofi-dark.rasi"
cp "${walTemplate}" "${walTheme}"

# write in the 2nd line the new color list
sed -i "2i$content" "${walTheme}"
