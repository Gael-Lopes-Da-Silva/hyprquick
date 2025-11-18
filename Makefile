REPO_URL := https://github.com/Gael-Lopes-Da-Silva/hyprshewwll.git
INSTALL_DIR := $(HOME)/.config/hypr/hyprshewwll
FONT_DIR := $(HOME)/.fonts
FONT_TARGET := $(FONT_DIR)/SymbolsNerdFont
AUR_HELPER ?= paru # Default to paru, can be overridden: make install AUR_HELPER=yay

PACKAGES := \
	eww-git \
	awww-git \
	brightnessctl \
	cliphist \
	wl-clipboard \
	ddcutil \
	gpu-screen-recorder \
	hypridle \
	hyprlock \
	hyprpicker \
	hyprshot \
	hyprsunset \
	libnotify \
	playerctl \
	uwsm \
	upower \
	power-profiles-daemon \
	imagemagick \
	tesseract


all: install

install: check_root clone_repo install_fonts setup_aur_helper install_packages start
	@echo "[DONE] Installation complete."

update: check_root clone_repo start
	@echo "[DONE] Update complete."

check_root:
	@if [ "$(shell id -u)" -eq 0 ]; then \
		echo "[ERROR] Please do not run this as root." >&2; \
		exit 1; \
	fi

clone_repo:
	@if [ -d "$(INSTALL_DIR)" ]; then \
		echo "[INFO] Updating hyprshewwll..."; \
		git -C "$(INSTALL_DIR)" pull; \
	else \
		echo "[INFO] Cloning hyprshewwll..."; \
		git clone --depth=1 "$(REPO_URL)" "$(INSTALL_DIR)"; \
	fi

install_fonts:
	@if [ ! -d "$(FONT_TARGET)" ]; then \
		echo "[INFO] Copying local fonts to $(FONT_DIR)..."; \
		mkdir -p "$(FONT_DIR)"; \
		cp -r "$(INSTALL_DIR)/assets/fonts/"* "$(FONT_DIR)"; \
	else \
		echo "[INFO] Local fonts are already installed. Skipping copy."; \
	fi

setup_aur_helper:
	@if command -v yay &> /dev/null; then \
		echo "[INFO] Using yay as AUR helper."; \
		$(eval AUR_HELPER := yay); \
	elif ! command -v $(AUR_HELPER) &> /dev/null; then \
		echo "[INFO] Installing $(AUR_HELPER)..."; \
		TEMP_DIR=$$(mktemp -d); \
		git clone --depth=1 https://aur.archlinux.org/paru.git "$$TEMP_DIR/paru"; \
		(cd "$$TEMP_DIR/paru" && makepkg -si --noconfirm); \
		rm -rf "$$TEMP_DIR"; \
	else \
		echo "[INFO] Using $(AUR_HELPER) as AUR helper."; \
	fi

install_packages:
	@echo "[INFO] Installing required packages...";
	@$(AUR_HELPER) -Syy --needed --devel --noconfirm $(PACKAGES) || true

start:
	@echo "[INFO] Starting hyprshewwll"
	@eww daemon 2>/dev/null || true
	@killall hyprshewwll 2>/dev/null || true
	@uwsm app -- eww open all > /dev/null 2>&1 &
	@disown

clean:
	@echo "[INFO] Removing configuration directory: $(INSTALL_DIR)"
	@rm -rf "$(INSTALL_DIR)"
	@echo "[DONE] Clean up complete. Note: packages and fonts were NOT removed."


.PHONY: all install update clean setup_aur_helper install_packages install_fonts start
