echo "Configuring Environment"

echo "Copying configuration files..."
config_files=(".zshenv" ".vimrc" ".gitignore_global" ".gitconfig")

for file in "${config_files[@]}"
do
    if [ -f "$file" ]; then
        echo "Copying $file to home directory..."
        cp "$file" ~/
    else
        echo "⚠ Warning: $file not found in current directory"
    fi
done

echo "Setting up Java environment variables..."
if ! grep -q "JAVA_HOME" ~/.zshrc; then
    echo 'export JAVA_HOME=$(/usr/libexec/java_home -v21)' >> ~/.zshrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
    echo "✓ Java environment variables added to .zshrc"
else
    echo "✓ Java environment variables already configured"
fi

echo "Configuring Git..."
if [ ! -f ~/.gitignore_global ]; then
    cat > ~/.gitignore_global << 'EOF'
.env
.env.*
.DS_Store
node_modules/
# ... other patterns
EOF
fi
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "Anthony Salib"
git config --global user.email "asalib02@gmail.com"
git config --global credential.helper osxkeychain
git config --global pull.rebase false

echo "✓ Git configuration complete!"

echo ""
echo "Verifying installations..."

if command -v java &> /dev/null; then
    echo "Java version:"
    java -version
else
    echo "⚠ Java not found in PATH"
fi

if command -v gradle &> /dev/null; then
    echo "Gradle version:"
    gradle -version
else
    echo "  Gradle not found in PATH"
fi

echo ""
echo "✓ Environment configuration complete!"