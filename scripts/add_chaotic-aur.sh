#!/bin/bash

# Step 1: Add and sign the chaotic-aur key, then install chaotic-keyring and chaotic-mirrorlist packages

# Receive the key from the keyserver
echo "Receiving the key from keyserver..."
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

# Step 2: Backup the original pacman.conf and add chaotic-aur to pacman.conf if it doesn't already exist

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

echo "Setup completed successfully!"
