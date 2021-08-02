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
install exa

install kitty
install zbar-tools
install shellcheck
install pass
install pass-extension-otp

install ranger
install compton
install calc
install xdotool

install firefox
install chromium-browser
install lynx
install newsboat
install shellcheck
install thunderbird

install python2
install python3-venv
install python3-pip
install npm

install bspwm
install lxappearance
install rsync
install golang
install rofi

