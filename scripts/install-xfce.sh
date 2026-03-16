#!/bin/bash
#
# Author  : Gaston Gonzalez
# Date    : 16 March 2024
# Purpose : Install XFCE Desktop Environment and optionally remove GNOME
set -e

. ./env.sh
. ./functions.sh

et-log "Installing XFCE Desktop Environment..."

apt install \
  xfce4 \
  xfce4-goodies \
  xfce4-power-manager \
  lightdm \
  -y

# Set LightDM as default display manager if it was just installed
if [ -f /etc/X11/default-display-manager ]; then
    echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager
fi

# Ensure XFCE is the default session
update-alternatives --set x-session-manager /usr/bin/xfce4-session || true

if [ ! -z "${ET_REMOVE_GNOME}" ]; then
  et-log "Removing GNOME to save space (Cubic/Custom ISO optimization)..."
  apt purge \
    ubuntu-desktop \
    gnome-shell \
    gdm3 \
    gnome-control-center \
    -y
  apt autoremove -y
fi

et-log "XFCE installation and configuration complete."
