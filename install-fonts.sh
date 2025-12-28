echo "Installing Fonts"

fonts=(
    font-roboto
    font-roboto-mono
    font-sf-pro
    font-sf-compact
    font-sf-mono
    font-new-york
)

echo "Installing ${#fonts[@]} fonts..."
for font in "${fonts[@]}"
do
    echo "Installing $font..."
    brew install --cask "$font"
done

echo "✓ Font installation complete!"
echo ""