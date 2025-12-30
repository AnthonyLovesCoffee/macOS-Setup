echo "Configuring Environment"

if [ ! -d "config" ]; then
    echo "Error: 'config' directory not found"
    echo "Please run this script from the repository root directory"
    exit 1
fi

echo "Copying configuration files from config directory..."

# Copy .tmux.conf
if [ -f "config/.tmux.conf" ]; then
    cp config/.tmux.conf ~/.tmux.conf
    echo "✓ Copied .tmux.conf"
else
    echo "⚠ Warning: config/.tmux.conf not found"
fi

# Copy .zshrc
if [ -f "config/.zshrc" ]; then
    # Backup existing .zshrc if it exists
    if [ -f ~/.zshrc ]; then
        cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
        echo "✓ Backed up existing .zshrc"
    fi
    cp config/.zshrc ~/.zshrc
    echo "✓ Copied .zshrc"
else
    echo "⚠ Warning: config/.zshrc not found"
fi

# Copy Git ignore file
echo ""
if [ -f "config/ignore" ]; then
    cp config/ignore ~/.ignore
    echo "✓ Copied ignore file to ~/.ignore"
else
    echo "⚠ Warning: config/ignore not found"
fi

# Java environment setup
echo ""
echo "Setting up Java environment variables..."
if ! grep -q "JAVA_HOME" ~/.zshrc 2>/dev/null; then
    echo "" >> ~/.zshrc
    echo "# Java environment" >> ~/.zshrc
    echo 'export JAVA_HOME=$(/usr/libexec/java_home -v21)' >> ~/.zshrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
    echo "✓ Added Java environment variables to .zshrc"
else
    echo "✓ Java environment variables already configured in .zshrc"
fi

# Git configuration
echo ""
echo "Configuring Git..."

# Check if git config file exists
if [ -f "config/.gitconfig" ]; then
    echo "Found config/.gitconfig"
    read -p "Do you want to use the Git config from config/.gitconfig? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp config/.gitconfig ~/.gitconfig
        echo "✓ Copied .gitconfig from config directory"
    else
        echo "Using manual Git configuration..."
    fi
else
    echo "No config/.gitconfig found, using manual configuration..."
fi

# Always configure these settings
git config --global core.excludesfile ~/.ignore

# Prompt for Git user info if not already configured
CURRENT_NAME=$(git config --global user.name)
CURRENT_EMAIL=$(git config --global user.email)

if [ -z "$CURRENT_NAME" ]; then
    read -p "Enter your Git name: " git_name
    git config --global user.name "$git_name"
else
    echo "✓ Git user.name already set to: $CURRENT_NAME"
    read -p "Keep this name? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        read -p "Enter your Git name: " git_name
        git config --global user.name "$git_name"
    fi
fi

if [ -z "$CURRENT_EMAIL" ]; then
    read -p "Enter your Git email: " git_email
    git config --global user.email "$git_email"
else
    echo "✓ Git user.email already set to: $CURRENT_EMAIL"
    read -p "Keep this email? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        read -p "Enter your Git email: " git_email
        git config --global user.email "$git_email"
    fi
fi

# Set other Git configurations if not already set
git config --global credential.helper osxkeychain 2>/dev/null
git config --global pull.rebase false 2>/dev/null

echo "✓ Git configuration complete!"

# iTerm2 configuration
echo ""
echo "iTerm2 Configuration:"
echo "-----------------------------------"

if [ -d "/Applications/iTerm.app" ]; then
    ITERM_PREFS="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
    
    if [ -f "config/com.googlecode.iterm2.plist" ]; then
        echo "Found iTerm2 config in config directory"
        read -p "Do you want to import iTerm2 preferences? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            cp config/com.googlecode.iterm2.plist "$ITERM_PREFS"
            echo "✓ Imported iTerm2 preferences"
            echo "  Please restart iTerm2 for changes to take effect"
        fi
    else
        echo "To save your current iTerm2 configuration:"
        echo "  1. Open iTerm2"
        echo "  2. Go to Preferences > General > Preferences"
        echo "  3. Check 'Load preferences from a custom folder or URL'"
        echo "  4. Set location to: $(pwd)/config"
        echo ""
        echo "Or copy your preferences manually:"
        echo "  cp ~/Library/Preferences/com.googlecode.iterm2.plist $(pwd)/config/"
    fi
else
    echo "⚠ iTerm2 not installed. Install it with:"
    echo "  brew install --cask iterm2"
fi

echo ""
echo "-----------------------------------"

# Verification
echo ""
echo "Verifying installations..."
echo "-----------------------------------"

if command -v java &> /dev/null; then
    echo "✓ Java version:"
    java -version 2>&1 | head -n 1
else
    echo "⚠ Java not found in PATH"
fi

if command -v mvn &> /dev/null; then
    echo "✓ Maven version:"
    mvn -version | head -n 1
else
    echo "⚠ Maven not found in PATH"
fi

if command -v tmux &> /dev/null; then
    echo "✓ tmux version:"
    tmux -V
else
    echo "⚠ tmux not installed. Install with: brew install tmux"
fi

echo ""
echo "=================================="
echo "✓ Environment Configuration Complete!"
echo "=================================="
echo ""
echo "Configuration files copied from config/ directory:"
if [ -f ~/.tmux.conf ]; then echo "  ✓ ~/.tmux.conf"; fi
if [ -f ~/.zshrc ]; then echo "  ✓ ~/.zshrc"; fi
if [ -f ~/.vimrc ]; then echo "  ✓ ~/.vimrc"; fi
if [ -f ~/.zshenv ]; then echo "  ✓ ~/.zshenv"; fi
if [ -f ~/.ignore ]; then echo "  ✓ ~/.ignore"; fi
echo ""
echo "Git configuration:"
echo "  Name:  $(git config --global user.name)"
echo "  Email: $(git config --global user.email)"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source ~/.zshrc"
echo "  2. Test tmux with: tmux"
echo "  3. Configure iTerm2 if needed (see instructions above)"
echo ""