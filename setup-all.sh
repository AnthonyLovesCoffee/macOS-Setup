#!/bin/bash

echo "=========================================="
echo "macOS Development Environment Setup"
echo "=========================================="
echo ""

if [ ! -f "1-install-homebrew.sh" ]; then
    echo "Error: Please run this script from the directory containing all setup scripts"
    exit 1
fi

echo "Making scripts executable..."
chmod +x *.sh

scripts=(
    "install-hb.sh"
    "install-apps.sh"
    "install-dev-tools.sh"
    "install-packages.sh"
    "install-fonts.sh"
    "configure-env.sh"
    "cleanup.sh"
)

for script in "${scripts[@]}"
do
    echo ""
    echo "=========================================="
    echo "Running: $script"
    echo "=========================================="
    
    if [ -f "$script" ]; then
        ./"$script"
        
        if [ $? -ne 0 ]; then
            echo "⚠ Warning: $script encountered errors"
            read -p "Continue anyway? (y/n) " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                echo "Setup aborted."
                exit 1
            fi
        fi
    else
        echo "Error: $script not found"
        exit 1
    fi
done

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Install any work-specific applications manually"
echo "3. Configure individual applications as needed"
echo "4. Sign in to applications that require authentication"
echo ""
echo "Done!"
echo ""
fastfetch