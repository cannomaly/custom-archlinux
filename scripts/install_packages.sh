#!/bin/bash

# Define the URL of the package list
#URL="~/Documents/package_list.txt"

# Download the package list
#curl -s $URL -o /tmp/packages.txt

# Read the package list and install each package
sudo pacman -S --needed --noconfirm $(cat ~/Documents/package_list.txt | grep -v '^#' | grep -v '^$')

# Cleanup
#rm /tmp/packages.txt

echo "Installation completed."
