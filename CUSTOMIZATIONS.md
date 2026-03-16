# Customizations for XFCE and Low-Resource Hardware

This document describes the customizations added to support the XFCE desktop environment, specifically optimized for low-resource hardware like the ASUS C202S.

## Overview

While the original EmComm Tools OS Community project is built for GNOME, these changes allow for a lightweight, high-performance alternative using XFCE. This is ideal for devices with limited RAM and CPU, or when building custom ISOs (e.g., using Cubic).

## New Scripts and Modifications

### 1. `scripts/install-xfce.sh` (New)
An automated installer for the XFCE desktop environment.
- Installs `xfce4`, `xfce4-goodies`, and `xfce4-power-manager`.
- Installs and configures `lightdm` as the default display manager.
- Sets XFCE as the system-wide default session using `update-alternatives`.
- **Optional**: Can purge GNOME components to save ~1.5GB+ of disk space.

### 2. `scripts/configure-xfce.sh` (New)
Applies hardware-specific optimizations for the ASUS C202S and similar devices:
- **DPI Scaling**: Sets Font DPI to 120 (approx. 1.25x scaling) for 11.6" screens.
- **Performance**: Disables window animations to reduce CPU/GPU load.
- **Power Management**: Disables all sleep, hibernate, and screen blanking to prevent radio link drops during emergency operations.

### 3. Updated `scripts/install.sh`
The main installer now includes conditional logic to detect the desktop environment:
- If XFCE is detected, it calls `configure-xfce.sh`.
- Supports environment variables to automate the installation of XFCE and the removal of GNOME.

### 4. Updated `overlay/opt/emcomm-tools/bin/et-term`
Added support for the `xfce4-terminal` color palette, ensuring high-visibility xterm colors are applied regardless of the desktop environment.

### 5. Updated `scripts/install-branding.sh`
Added XFCE support for applying the EmComm Tools wallpaper using `xfconf-query`.

## How to Use These Customizations

### Automated XFCE Installation
To install XFCE as part of the main `install.sh` flow:
```bash
sudo ET_INSTALL_XFCE=true ./install.sh
```

### Building a Lightweight Custom ISO (Cubic)
When building a custom ISO and you want to replace GNOME entirely with XFCE to save space and RAM:
```bash
sudo ET_INSTALL_XFCE=true ET_REMOVE_GNOME=true ./install.sh
```

## Hardware Compatibility
These settings were specifically tested and optimized for:
- **Device**: ASUS C202S (Celeron N3060, 4GB RAM)
- **Storage**: 128GB USB 3.0 with Persistence
- **Base OS**: Ubuntu Kinetic (Old-Releases)
