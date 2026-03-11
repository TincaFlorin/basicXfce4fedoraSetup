#!/usr/bin/env bash

#Check if the script is run as root
if [ "$EUID" -eq 0 ]; then
    echo "Please do not run this script as root. Exiting."
    exit 1
fi

printf "Installing XFCE4 desktop environment and related packages...\n"
##  Install XFCE4 and related packages
sudo dnf install xfwm4 xfce4-panel xfdesktop xfce4-session \
    xfce4-settings xfce4-appfinder Thunar terminator xfce4-notifyd  \
    xfce4-power-manager lightdm-settings pavucontrol pipewire \
    network-manager-applet blueman xfce4-pulseaudio-plugin xfce4-weather-plugin \
    xfce4-sensors-plugin xfce4-systemload-plugin xfce4-netload-plugin \
    xfce4-cpugraph-plugin xfce4-mount-plugin xfce4-screenshooter xfce4-panel-profiles \
    picom stow zsh ristretto mpv dnfdragora dnfdragora-updater \
    librsvg2-tools optipng power-profiles-daemon flatpak gnome-keyring \
    git xorg-x11-drv-amdgpu xrandr vim


printf "Configuring LightDM...\n"
## Enable LightDM
sudo systemctl enable lightdm.service


printf "Configuring Flatpak...\n"
## Enable flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

printf "Installing Firefox Flatpak application...\n"
## Install firefox flatpak
flatpak install flathub org.mozilla.firefox


# Optional: Install EnvyControl for NVIDIA GPU management
# # Clone the EnvyControl repository
# git clone https://github.com/bayasdev/envycontrol.git


# # Setup nvidia repo
# dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-43.noarch.rpm

# # Update the system
# dnf upgrade --refresh


# # Install NVIDIA drivers
# dnf install akmod-nvidia xorg-x11-drv-nvidia

# # Enable LightDM
# sudo systemctl enable lightdm.service

