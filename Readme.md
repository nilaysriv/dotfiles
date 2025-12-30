#  Fedora 43 KDE Edition Dotfiles

My personal configuration for a reproducible Fedora KDE environment. Optimized for my **ASUS TUF FA506QM** (Ryzen 9 5900HX / RTX 3060).

##  One-Command Setup

On a fresh install of Fedora, run:

```bash
git clone [https://github.com/nilaysriv/dotfiles.git](https://github.com/nilaysriv/dotfiles.git) ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh

```

## What's Included?

* **System Packages:** Managed via DNF (includes core dev tools and  dependencies).
* **Flatpaks:** All GUI applications (Discord, VS Code, etc.).
* **KDE Plasma:** UI Layout, Global Shortcuts, and KWin behavior via `Konsave`.
* **Hardware Tweaks:** (Optional) Support for ASUS TUF power profiles.

## Manual Post-Install Steps

### 1. Restore KDE Configs

The `install.sh` script handles the installation, but you may need to apply the profile manually if it doesn't automatically trigger:

```bash
konsave -a my_setup

```

### 2. Nvidia Drivers (Hardware Specific)

If the script hasn't handled it, ensure the RPM Fusion repos are enabled for the RTX 3070:

```bash
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

```

## Screenshots
![Desktop]([https://github.com/nilaysriv/TerminalGPT/raw/main/Screenshots/Screenshot_20251229_122103-1.png](https://github.com/nilaysriv/dotfiles/blob/main/Screenshots/Desktop.png))
