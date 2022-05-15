#!/bin/bash
# script directly inspired by https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/aptinstall.sh

sudo add-apt-repository ppa:mozillateam/firefox-next -y
sudo apt update

function install {
    echo "Installing: ${1}..."
    sudo apt install -y "${1}"
}

function custom_install {
  [[ "${1}" -ne 0 ]] && echo "Installing: ${1}" && exec "${2}" || echo "Already installed. ${1}" 
}

# from stdin
while read -r program options; do
  if [[ -z "${options}" ]]; then
    install "${program}"
  else
    custom_install "${program}" "${options}"
  fi
done
