#!/bin/bash

### DO NOT LAUNCH AS ROOT ###

if [ "$EUID" -ne 0 ]
  then echo "Please do not run as root"
       echo "chmod +x postinstall.sh and run it as your user"
  exit
fi

### INSTALLING PACKAGE ###
AUDIO="pipewire pulsemixer"
WM="bspwm sxhkd"
BASE="xorg-minimal xorg-fonts xf86-video-intel"
BROWSER="qutebrowser"
HUD="rofi polybar dunst lxappearance"
TERMAPP="alacritty fish-shell bpytop"

sudo xbps-install $BASE $WM $AUDIO $HUD $BROWSER $TERMAPP

### ENABLE APP'S FOR RUNIT ###

sudo ln -s /etc/sv/wpa_supplicant /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/sddm /var/service

### COPIYNG DOT FILES ###

sudo cp -r .config ~/

### KEYBOARD LANGUAGE FOR X11 ###

sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/

### GRUB CONFIGURATION ###

sudo cp grub /etc/default/grub
