#!/bin/bash

DIR=`pwd` 

### DO NOT LAUNCH AS ROOT ###

if [ "$EUID" -ne 0 ]
  then echo "Please do not run as root"
       echo "chmod +x postinstall.sh and run it as your user"
  exit
fi

### INSTALLING PACKAGE ###
AUDIO="pulseaudio pulsemixer"
WM="bspwm sxhkd"
BASE="xorg-minimal xorg-fonts xf86-video-intel"
BROWSER="qutebrowser"
HUD="rofi feh polybar dunst"
TERMAPP="kitty neovim htop neofetch wget maim setxkbmap xclip"

sudo xbps-install $BASE $WM $AUDIO $HUD $BROWSER $TERMAPP


### ENABLE APP'S FOR RUNIT ###

sudo ln -s /etc/sv/wpa_supplicant /var/service
sudo ln -s /etc/sv/dbus /var/service


### Discord ###

wget https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.tar.gz | tar -xf 
cd Discord ; sudo chmod +x Discord ; ./Discord


