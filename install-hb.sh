#!/bin/bash

echo "Homebrew Setup"...

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed. Updating..."
    brew update
fi

echo "Tapping Homebrew repositories..."
brew tap homebrew/cask
brew tap homebrew/cask-fonts

echo "✓ Homebrew setup complete!"
echo ""