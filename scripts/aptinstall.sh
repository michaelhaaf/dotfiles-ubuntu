#!/bin/bash
# script directly inspired by https://github.com/victoriadrake/dotfiles/blob/ubuntu-19.10/scripts/aptinstall.sh

sudo add-apt-repository ppa:mozillateam/firefox-next -y
sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install curl
install git
install htop
install openvpn
install vim

install kitty
install zbar-tools
install shellcheck
install pass
install pass-extension-otp

install gnome-tweaks
install firefox
install chromium-browser
install lynx
install newsboat

install python3-venv
install python3-pip
install npm
