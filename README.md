# macOS-Setup

A modular collection of Bash scripts for automating the setup of a complete macOS development environment. Each script handles a specific aspect of the setup process, allowing you to run only what you need.

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Scripts](#scripts)
- [What Gets Installed](#what-gets-installed)
- [Customization](#customization)
- [Usage Examples](#usage-examples)
- [Troubleshooting](#troubleshooting)
- [Configuration Files](#configuration-files)

##  Overview

This toolkit provides a modular approach to setting up a macOS development environment. Instead of one large monolithic script, the setup is divided into focused scripts that handle specific tasks:

- Homebrew installation
- GUI applications
- Development tools
- Programming packages
- Fonts
- Environment configuration
- Cleanup

##  Prerequisites

- macOS (tested on Monterey and later)
- Administrator privileges
- Internet connection
- At least 10GB of free disk space

##  Quick Start

### Option 1: Run Everything

```bash
# Clone or download all scripts to a directory
cd ~/Downloads/macos-setup

# Make the master script executable
chmod +x setup-all.sh

# Run the complete setup
./setup-all.sh
```

### Option 2: Run Individual Scripts

```bash
# Make scripts executable
chmod +x *.sh

# Run only what you need
./install-hb.sh
./install-apps.sh
./configure-env.sh
```

## 📜 Scripts

### 1. `install-hb.sh`
**Purpose**: Install or update Homebrew and tap necessary repositories

- Checks if Homebrew is installed
- Installs Homebrew if missing
- Updates Homebrew if already installed
- Configures Homebrew for Apple Silicon Macs
- Taps `homebrew/cask` and `homebrew/cask-fonts`


### 2. `install-apps.sh`
**Purpose**: Install GUI applications via Homebrew Cask

**Applications Installed**:
- **Communication**: WhatsApp, Discord, Zoom, Microsoft Teams
- **Development**: VS Code, IntelliJ IDEA CE, Docker
- **Productivity**: Alfred, Todoist, BusyCal, Rectangle, Anki
- **Media & Utilities**: Spotify, AdGuard

### 3. `install-dev-tools.sh`
**Purpose**: Install development tools, languages, and CLIs

**Tools Installed**:
- Git
- Python 3.13
- OpenJDK 21
- Gradle
- Yarn
- PostgreSQL
- AWS CLI
- OpenShift CLI
- Xcode Command Line Tools


### 4. `4nstall-packages.sh`
**Purpose**: Install Python packages, Node.js packages, and VS Code extensions

**Python Packages**:
- Development: pipenv, requests, python-dotenv
- Data Science: NumPy, Pandas, SciPy, scikit-learn, TensorFlow
- Web Scraping: BeautifulSoup4
- Visualization: Matplotlib, Seaborn, Plotly, Bokeh
- Web Frameworks: Flask, Django
- Utilities: tqdm, yarl

**Node.js Packages**:
- create-react-app
- create-react-native-app
- expo-cli
- typescript
- dotenv

**VS Code Extensions**:
- AI Tools: Claude Code
- Python: Python extension
- Java: Java Pack (debug, dependency, test, upgrade, Gradle)
- Remote Development: Remote Containers, Remote SSH
- Docker: Docker extension
- Web Development: React Native Tools, TypeScript, Prettier, Live Server
- Utilities: Rainbow CSV, Project Tree, Peacock, Live Share
- Fun
### 5. `install-fonts.sh`
**Purpose**: Install fonts via Homebrew Cask

**Fonts Installed**:
- Roboto (Regular & Mono)
- SF Pro
- SF Compact
- SF Mono
- New York

### 6. `configure-env.sh`
**Purpose**: Configure shell environment, Java, and Git

**Configuration Tasks**:
- Copies configuration files (`.zshenv`, `.vimrc`, `.gitignore_global`, `.gitconfig`) to home directory
- Sets up Java 21 environment variables in `.zshrc`
- Configures Git with user information and preferences
- Verifies Java and Maven installations

**⚠️ IMPORTANT**: Update the Git user.name and user.email in this script before running!

### 7. `cleanup.sh`
**Purpose**: Clean up Homebrew caches and temporary files

**Cleanup Tasks**:
- Runs `brew cleanup`
- Removes Homebrew cache files from `/Library/Caches/Homebrew/`

### `setup-all.sh` (Master Script)
**Purpose**: Run all setup scripts in order with error handling

**Features**:
- Makes all scripts executable
- Runs scripts in the correct order
- Provides progress updates
- Handles errors with optional continuation
- Displays final setup instructions

## 🎨 Customization

Each script contains arrays at the top that define what gets installed. Simply edit these arrays to add or remove items:

### Example: Adding an Application

Edit `2-install-apps.sh`:

```bash
casks=(
    microsoft-edge
    whatsapp
    # ... existing apps ...
    slack              # Add this line
    notion             # Add this line
)
```

### Example: Adding a Python Package

Edit `4-install-packages.sh`:

```bash
pip_packages=(
    pipenv
    # ... existing packages ...
    flask              # Add this line
    django             # Add this line
)
```

### Example: Changing Git Configuration

Edit `6-configure-environment.sh`:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 💡 Usage Examples

### Install Only Core Development Tools

```bash
./1-install-homebrew.sh
./3-install-dev-tools.sh
./6-configure-environment.sh
```

### Install Apps and Fonts Only

```bash
./1-install-homebrew.sh
./2-install-apps.sh
./5-install-fonts.sh
```

### Reinstall Just Python Packages

```bash
./4-install-packages.sh
```

### Update All Homebrew Packages

```bash
./1-install-homebrew.sh
brew upgrade
./7-cleanup.sh
```

### Skip Interactive Prompts in Master Script

```bash
yes | ./setup-all.sh
```

## 🔧 Troubleshooting

### Homebrew Installation Fails

```bash
# Try installing manually
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then run the rest of the scripts
./2-install-apps.sh
```

### Permission Denied Errors

```bash
# Make scripts executable
chmod +x *.sh

# If still failing, check file ownership
ls -la *.sh
```

### Python Package Installation Fails

```bash
# Upgrade pip first
pip3 install --upgrade pip

# Then retry
./4-install-packages.sh
```

### VS Code Extensions Not Installing

```bash
# Ensure VS Code is in PATH
which code

# If not found, add VS Code to PATH
# Open VS Code > Command Palette (Cmd+Shift+P) > 
# Type "shell command" > Select "Install 'code' command in PATH"

# Then retry
./4-install-packages.sh
```

### Java Not Found After Installation

```bash
# Source the updated .zshrc
source ~/.zshrc

# Verify Java installation
java -version
echo $JAVA_HOME
```

### Homebrew Cask Download Fails

```bash
# Clear Homebrew cache
rm -rf "$(brew --cache)"

# Retry the specific app
brew install --cask <app-name>
```

### Git Configuration Not Applied

```bash
# Verify configuration
git config --global --list

# Manually apply if needed
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 📁 Configuration Files

The `6-configure-environment.sh` script expects the following configuration files to be in the same directory:

- **`.zshenv`**: Zsh environment variables
- **`.vimrc`**: Vim editor configuration
- **`.gitignore_global`**: Global Git ignore patterns
- **`.gitconfig`**: Git configuration

### Sample `.gitignore_global`

```
# macOS
.DS_Store
.AppleDouble
.LSOverride

# IDEs
.vscode/
.idea/
*.swp
*.swo

# Dependencies
node_modules/
vendor/

# Build outputs
dist/
build/
*.log
```

### Creating Missing Configuration Files

If you don't have these files, you can create minimal versions:

```bash
# Create minimal .gitignore_global
cat > .gitignore_global << EOF
.DS_Store
node_modules/
*.log
EOF

# Create minimal .vimrc
cat > .vimrc << EOF
syntax on
set number
EOF

# Create minimal .zshenv
touch .zshenv
```

## 🔄 Post-Installation

After running the setup scripts:

1. **Restart Terminal**: Close and reopen your terminal to load new environment variables
   ```bash
   source ~/.zshrc
   ```

2. **Verify Installations**:
   ```bash
   brew --version
   git --version
   python3 --version
   java -version
   node --version
   code --version
   ```

3. **Sign In to Applications**: Open installed apps and sign in where needed

4. **Configure Applications**: Set preferences for VS Code, IntelliJ, Docker, etc.

5. **Install Work-Specific Tools**: Add any company-specific applications manually

6. **Update Dotfiles**: Further customize your `.zshrc`, `.vimrc`, and other config files

## 🛡️ Safety Features

- Scripts check if tools are already installed before reinstalling
- Non-destructive operations (won't overwrite existing configurations without warning)
- Error handling in master script allows continuation after failures
- Cleanup script safely removes only cache files

## 📝 Notes

- Script execution order matters when using individual scripts
- Some installations may require administrator password
- First-time setup can take 40-80 minutes depending on internet speed
- Homebrew cask installations go to `/Applications`
- Python packages install globally via pip3
- Node packages install globally via npm
- VS Code extensions install to user profile

## 🤝 Contributing

To add new tools or modify existing configurations:

1. Edit the appropriate script's array
2. Test the installation manually first
3. Update this README with your changes
4. Consider sharing your customizations

## 📄 License

These scripts are provided as-is for personal use. Feel free to modify and distribute as needed.

## 🔗 Useful Resources

- [Homebrew Documentation](https://docs.brew.sh)
- [Homebrew Cask Search](https://formulae.brew.sh/cask/)
- [VS Code Extension Marketplace](https://marketplace.visualstudio.com/vscode)
- [Python Package Index (PyPI)](https://pypi.org)
- [npm Registry](https://www.npmjs.com)

---

**Created by**: Anthony Salib  
**Last Updated**: December 2025  
**Version**: 1.0.0