#!/bin/bash

# 1. Update system
sudo dnf update -y

# 2. Re-enable COPR repositories
echo "Enabling COPR repositories..."
if [ -f dnf-copr-repos.txt ]; then
    while read -r repo; do
        sudo dnf copr enable -y "$repo"
    done < dnf-copr-repos.txt
else
    echo "Warning: dnf-copr-repos.txt not found, skipping."
fi

# 3. Install DNF packages
echo "Installing DNF packages..."
sudo dnf install -y $(cat dnf-packages.txt)

# 4. Install Flatpaks
echo "Installing Flatpaks..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
if [ -f flatpaks.txt ]; then
    xargs flatpak install flathub -y < flatpaks.txt
fi

# 5. Restore Systemd Services
echo "Enabling Systemd services..."
if [ -f enabled-services.txt ]; then
    while read -r svc; do
        sudo systemctl enable "$svc"
    done < enabled-services.txt
fi

if [ -f enabled-user-services.txt ]; then
    while read -r usvc; do
        systemctl --user enable "$usvc"
    done < enabled-user-services.txt
fi

# 6. Restore KDE Configs
echo "Restoring KDE configurations..."
python -m venv .venv
source .venv/bin/activate
pip install konsave
konsave -i kde/*.knsv
konsave -a my_setup

echo "Setup complete! Rebooting."
reboot