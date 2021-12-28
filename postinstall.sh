#!/bin/bash

### DO NOT LAUNCH AS ROOT ###

if [ "$EUID" -ne 0 ]
  then echo "Please do not run as root"
       echo "chmod +x postinstall.sh and run it as your user"
  exit
fi

### INSTALLING PACKAGE ###
AUDIO="pipewire pulsemixer"
SPOTIFY="spotifyd spotify-qt"
FONT="font-iosevka font-awesome"
WM="bspwm sxhkd"
BASE="xorg-minimal xorg-fonts xf86-video-intel"
BROWSER="qutebrowser"
HUD="rofi feh picom polybar dunst lxappearance"
TERMAPP="alacritty neovim fisho-shell bpytop neofetch wget maim"

sudo xbps-install $BASE $WM $AUDIO $HUD $BROWSER $TERMAPP $SPOTIFY $FONT

### ENABLE APP'S FOR RUNIT ###

sudo ln -s /etc/sv/wpa_supplicant /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/sddm /var/service

### COPIYNG DOT FILES ###

sudo cp -r .config ~/

### chmod files ###

chmod +x ~/.config/bspwm/bspwmrc

### GRUB theme ### 

wget -O - https://github.com/shvchk/poly-dark/raw/master/install.sh | bash

### Discord ###

wget https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.tar.gz
wget https://github.com/BetterDiscord/installer/releases/download/v1.1.1/BetterDIscord-Linux.AppImage




