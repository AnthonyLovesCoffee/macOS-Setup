#!/bin/bash

# Script: 2-install-apps.sh
# Purpose: Install GUI applications via Homebrew Cask

echo "=================================="
echo "Installing Applications"
echo "=================================="

# Applications list
casks=(
    whatsapp
    spotify
    discord
    zoom
    microsoft-teams
    visual-studio-code
    docker
    raycast
    todoist
    busycal
    rectangle
    anki
    adguard
    steam
    todoist-app
    notion
    iterm2
    logi-options+
    google-chrome
    stremio
    shottr
    postman
)

# Installing applications
echo "Installing ${#casks[@]} applications..."
for app in "${casks[@]}"
do
    echo "Installing $app..."
    brew install --cask --appdir="/Applications" "$app"
done

echo "✓ Application installation complete!"
echo ""