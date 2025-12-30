#!/bin/bash

# 1. Update system
sudo dnf update -y

# 2. Install DNF packages
echo "Installing DNF packages..."
sudo dnf install -y $(cat dnf-packages.txt)

# 3. Install Flatpaks
echo "Installing Flatpaks..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
xargs flatpak install flathub -y < flatpaks.txt

# 4. Restore KDE Configs
echo "Restoring KDE configurations..."
python -m venv .venv
source .venv/bin/activate
pip install konsave
konsave -i kde/*.knsv
konsave -a my_setup

echo "Setup complete! Please reboot."
