#!/bin/bash
set -o errexit -o pipefail -o noclobber -o nounset

# i don't love this but i'll keep it for now
# Up from scripts dir
cd ..

dotfilesDir=$(pwd)

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr="$(date +%Y-%m-%d-%H%M)"

  if [ ! -f "${dotfilesDir}/${1}" ] && [ ! -d "${dotfilesDir}/${1}" ]; then
	# Dotfile not in this repo, abort
	echo "Requested dotfile ${1} not present in dot directory. Copy it here first then try again."
	exit 1
  fi

  if [ -h "${HOME}/${1}" ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  cp -rs "${dotfilesDir}/${1}" ${dest}
}

linkDotfile .vimrc
linkDotfile .bashrc
linkDotfile .xinitrc
linkDotfile .config/lynx
linkDotfile .config/newsboat
linkDotfile .config/kitty
