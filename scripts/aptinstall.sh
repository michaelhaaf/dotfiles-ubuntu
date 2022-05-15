#!/bin/bash
# script directly inspired by https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/aptinstall.sh

sudo add-apt-repository ppa:mozillateam/firefox-next -y
sudo apt update

function install {
  if [ "${1}" -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y "${1}"
  else
    echo "Already installed: ${1}"
  fi
}

function custom_install {
  [[ "${1}" -ne 0 ]] && echo "Installing: ${1}" && exec "${2}" || echo "Already installed. ${1}" 
}

install curl
install git
install htop
install vim
install exa
install calcurse

install kitty
install zbar-tools
install shellcheck
install pass
install pass-extension-otp

install ranger
install calc
install xdotool

install firefox
install chromium-browser
install lynx
install newsboat

install python2
install python3-venv
install python3-pip
install npm
install jq

install bspwm
install lxappearance
install rsync
install golang
install rofi
install zathura
install mpv
install sxiv

install pavucontrol
install pulsemixer
install redshift
install cargo

# experimental
custom_install flavours "cargo install --locked flavours"
