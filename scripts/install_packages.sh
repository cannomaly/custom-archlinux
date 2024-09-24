#!/bin/bash
# Define the URL of the package list (raw version)
URL="https://raw.githubusercontent.com/cannomaly/dotfiles/main/package_list.txt"

# Receive the key from the keyserver
echo "Adding chaotic-aur repository"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com

# Locally sign the key
echo "Locally signing the key..."
sudo pacman-key --lsign-key 3056513887B78AEB

# Install the chaotic-keyring package
echo "Installing chaotic-keyring..."
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'

# Install the chaotic-mirrorlist package
echo "Installing chaotic-mirrorlist..."
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Backup the original pacman.conf
echo "Backing up pacman.conf..."
sudo cp /etc/pacman.conf /etc/pacman.conf.bak

# Check if the chaotic-aur section is already present
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    # Append the chaotic-aur section to the pacman.conf
    echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
    echo "chaotic-aur repository added to /etc/pacman.conf."
else
    echo "chaotic-aur repository already exists in /etc/pacman.conf."
fi

echo "chaotic-aur successfully added!"

# Update system packages
echo "Updating system"
sudo pacman -Syu --noconfirm

echo "Update complete"

# Install prerequisites
echo "Installing prerequisites"
sudo pacman -S --needed --noconfirm base-devel git

# Clone the yay repository from AUR
cd ~/
git clone https://aur.archlinux.org/yay.git
sudo chown -R $(whoami):$(whoami) yay

# Build and install yay
cd yay
makepkg -si --noconfirm

# Clean up
cd ~/
rm -rf ~/yay

# Install nodejs and bash language server
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g bash-language-server

echo "Installation complete"

# Download the package list
echo "Downloading package list from $URL"
curl -s $URL -o /tmp/packages.txt

# Read the package list and install each package
echo "Installing packages from /tmp/packages.txt"
sudo pacman -S --needed --noconfirm $(cat /tmp/packages.txt | grep -v '^#' | grep -v '^$')

# Cleanup
rm /tmp/packages.txt

echo "Installation completed."
