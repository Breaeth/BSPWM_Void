#!/bin/bash

### DO NOT LAUNCH AS ROOT ###

if [ "$EUID" -ne 0 ]
  then echo "Please do not run as root"
       echo "chmod +x postinstall.sh and run it as your user"
  exit
fi

### INSTALLING PACKAGE ###
AUDIO="pipewire pulsemixer alsa-pipewire alsa-utils pamixer"
SPOTIFY="spotifyd spotify-qt"
FONT="font-iosevka font-awesome"
WM="bspwm sxhkd"
BASE="xorg-minimal xorg-fonts xf86-video-intel sddm"
BROWSER="qutebrowser"
HUD="rofi feh picom polybar dunst lxappearance"
TERMAPP="alacritty neovim fish-shell htop neofetch wget maim setxkbmap xclip gpick"
QT="qt5-svg qt5-quickcontrols2 qt5-graphicaleffects"

sudo xbps-install $BASE $WM $AUDIO $HUD $BROWSER $TERMAPP $SPOTIFY $FONT $QT

### INSTALL PICOM-IBHAGWAN ###

git clone --depth=1 https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
git clone https://github.com/ibhagwan/picom-ibhagwan-template
mv picom-ibhagwan-template ./srcpkgs/picom-ibhagwan
./xbps-src pkg picom-ibhagwan
sudo xbps-install --repository=hostdir/binpkgs picom-ibhagwan 

### CREATE IMPORTANT FOLDER ### 

sudo mkdir -p /etc/sddm.conf.d

### ENABLE APP'S FOR RUNIT ###

sudo ln -s /etc/sv/wpa_supplicant /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/sddm /var/service

### GRUB theme ### 

wget -O - https://github.com/shvchk/poly-dark/raw/master/install.sh | bash

### Discord ###

wget https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.tar.gz | tar -xf 

### MOOVING IMPORTANT FILES ###

mv .config .xinitrc .bash_profile $HOME
#For SDDM
mv sddm/sugar-candy /usr/share/sddm/themes/
mv avatar.conf /etc/sddm.conf.d/
#


