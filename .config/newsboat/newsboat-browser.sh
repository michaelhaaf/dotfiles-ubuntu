#!/bin/bash

# I haven't been clever enough to figure out how not to repeat this config
# see .bashrc
# TODO: in the future, replace this with a bash command functions (see https://www.youtube.com/watch?v=Vdd2MTv6vrs)

export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export LYNX_LSS="$HOME/.config/lynx/lynx.lss"

lynxpath=/usr/bin/lynx
useragent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.118    0.79 Safari/537.1 Lynx"

source ~/.bashrc
exec "$lynxpath" --useragent="$useragent" "$@"
source ~/.bashrc

exit 0

