#!/bin/bash

echo "Installing Development Tools..."

brew_tools=(
    git
    python@3.13
    node@24
    openjdk@21
    gradle
    yarn
    postgresql
    awscli
    openshift-cli
    tmux
    bat
    fzf
    fd
    jq
    pass
    stow
    fastfetch
)

# Installing development tools
echo "Installing ${#brew_tools[@]} development tools..."
for tool in "${brew_tools[@]}"
do
    echo "Installing $tool..."
    brew install "$tool"
done

# Install Xcode Command Line Tools
echo "Installing Xcode Command Line Tools..."
xcode-select --install 2>/dev/null || echo "Xcode Command Line Tools already installed"

echo "✓ Development tools installation complete!"
echo ""