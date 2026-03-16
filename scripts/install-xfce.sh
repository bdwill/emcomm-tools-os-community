#!/bin/bash
#
# Author  : Gaston Gonzalez
# Date    : 16 March 2024
# Purpose : Install XFCE Desktop Environment
set -e

. ./env.sh
. ./functions.sh

et-log "Installing XFCE Desktop Environment..."

apt install \
  xfce4 \
  xfce4-goodies \
  xfce4-power-manager \
  -y

et-log "XFCE installation complete."
