#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update the package database
echo "Updating package database..."
sudo pacman -Syu --noconfirm

# Install dependencies: Python and other build essentials
echo "Installing Python and development tools..."
sudo pacman -S --noconfirm python python-pip base-devel

# Check if Fish shell is being used and adjust accordingly for activation
if [[ "$SHELL" == *"fish"* ]]; then
    echo "Detected Fish shell. Activating virtual environment for Fish..."
    VENV_ACTIVATE="source bots-env/bin/activate.fish"
else
    VENV_ACTIVATE="source bots-env/bin/activate"
fi

# Optional: Creating and activating a virtual environment
echo "Setting up Python virtual environment (optional)..."
python -m venv bots-env
eval "$VENV_ACTIVATE"

# Upgrade pip to the latest version
echo "Upgrading pip..."
pip install --upgrade pip

# Install discord.py
echo "Installing discord.py..."
pip install discord.py

# Optional: Deactivate the virtual environment
# deactivate

echo "Installation complete. You can now start using discord.py in your Python projects!"
