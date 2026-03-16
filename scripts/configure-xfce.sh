#!/bin/bash
#
# Author  : Gaston Gonzalez
# Date    : 16 March 2024
# Purpose : Configure XFCE for EmComm Tools
set -e

. ./env.sh
. ./functions.sh

et-log "Configuring XFCE..."

# Check if xfconf-query is available
if command -v xfconf-query >/dev/null 2>&1; then
  # Set Font DPI to 120 (equivalent to ~1.25x scaling on C202S)
  xfconf-query -c xsettings -p /Xft/DPI -n -t int -s 120
  
  # Disable window animations for better performance
  xfconf-query -c xfwm4 -p /general/animations -n -t bool -s false
  
  # Power Management: Disable sleep/hibernate to prevent radio link drops
  xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-ac -n -t int -s 0
  xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/blank-on-battery -n -t int -s 0
  xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lock-screen-suspend-hibernate -n -t bool -s false
  
  et-log "XFCE configuration applied."
else
  et-log "xfconf-query not found. Skipping XFCE specific config."
fi
