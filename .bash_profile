#!/bin/bash

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -f ~/.bashrc ] && . "$HOME/.bashrc"
