#!/bin/bash
# inspired by https://dev.to/mafflerbach/theme-switcher-based-on-rofi-and-pywal-4128

# grab the current color definition file
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

walTheme="/home/michael/.cache/wal/colors-rofi-dark.rasi" 

# write in the 10th line my color list
sed -i "2i${content}" "${walTheme}"
