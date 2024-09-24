#!/bin/bash

# Define the URL of the package list
URL="https://iso.builds.garudalinux.org/iso/garuda/dr460nized-gaming/240428/garuda-dr460nized-gaming-linux-zen-240428.pkgs.txt"

# Download the package list
curl -s $URL -o /tmp/garuda-pkgs.txt

# Extract only the package names without version numbers and save to a new file
awk -F '=' '{print $1}' /tmp/garuda-pkgs.txt | grep -v '^#' | grep -v '^$' > package_list_no_versions.txt

# Notify completion
echo "Package list saved to package_list_no_versions.txt"
