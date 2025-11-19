#!/bin/bash

set -e          # Exit immediately if a command fails
set -u          # Treat unset variables as errors
set -o pipefail # Prevent errors in a pipeline from being masked

REPO_URL="https://github.com/Gael-Lopes-Da-Silva/hyprquick.git"
INSTALL_DIR="$HOME/.config/hypr/hyprquick"

PACKAGES=(
    quickshell            # Widget framework

    brightnessctl         # Monitor brightness info
    cliphist              # Clipboard history manager
    wl-clipboard          # Wayland clipboard support
    ddcutil               # Monitor utils
    gpu-screen-recorder   # Screen recorder
    hypridle              # Idle event daemon
    hyprlock              # Screen locking
    hyprpicker            # Color picker
    hyprshot              # Screenshot utils
    hyprsunset            # Blue light filter
    libnotify             # Notification library
    playerctl             # Music player daemon
    uwsm                  # Wayland session manager
    upower                # Battery informations utils
    power-profiles-daemon # Power profiles
    imagemagick           # Image utility tools
    tesseract             # OCR utils
)

# Prevent running the script as root
if [ "$(id -u)" -eq 0 ]; then
    echo "[ERROR] Please do not run this script as root."
    exit 1
fi

# Clone or update the repository
if [ -d "$INSTALL_DIR" ]; then
    echo "[INFO] Updating hyprquick"
    git -C "$INSTALL_DIR" pull
else
    echo "[INFO] Cloning hyprquick"
    git clone --depth=1 "$REPO_URL" "$INSTALL_DIR"
fi

# Copy local fonts if not already present
if [ ! -d "$HOME/.fonts/SymbolsNerdFont" ]; then
  echo "[INFO] Copying local fonts to $HOME/.fonts/SymbolsNerdFont..."
  mkdir -p "$HOME/.fonts/SymbolsNerdFont"
  ln -s "$INSTALL_DIR/assets/fonts/"* "$HOME/.fonts"
else
  echo "[INFO] Local fonts are already installed. Skipping copy."
fi

# Linking hyprland config files
if [ -d "$HOME/.config/hypr" ]; then
    mv "$HOME/.config/hypr" "$HOME/.config/hypr_old"
fi
ln -s "$INSTALL_DIR/configs"* "$HOME/.config/hypr"

# Linking quickshell config files
if [ -d "$HOME/.config/quickshell" ]; then
    mv "$HOME/.config/quickshell" "$HOME/.config/quickshell_old"
fi
ln -s "$INSTALL_DIR/modules"* "$HOME/.config/quickshell"

# Install required packages using the detected AUR helper
echo "[INFO] Installing required packages..."
sudo pacman -Syy --needed --devel --noconfirm "${PACKAGES[@]}" || true

echo "[INFO] Starting hyprquick"
# eww daemon 2>/dev/null || true
disown

echo "[DONE] Installation complete."
