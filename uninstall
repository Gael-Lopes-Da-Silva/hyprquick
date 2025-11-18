#!/bin/bash

set -e          # Exit immediately if a command fails
set -u          # Treat unset variables as errors
set -o pipefail # Prevent errors in a pipeline from being masked

INSTALL_DIR="$HOME/.config/hypr/hyprshewwll"

echo "[INFO] This will permanently delete hyprshewwll cache, configuration, and remove its entry from hyprland.conf."
read -p "Are you sure you want to continue? [y/N] " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "[INFO] Be safe !"
    exit 1
fi
