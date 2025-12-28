# macOS-Setup
A comprehensive Bash script for automating the setup of a macOS development environment using Homebrew. This script installs essential applications, development tools, programming languages, frameworks, and fonts.

## Overview

This script automates the installation and configuration of a complete development environment on macOS, including:

- Desktop applications (productivity, communication, development)
- Programming languages and tools (Python, Java, Node.js, Git)
- Development frameworks and packages
- VS Code extensions
- Custom fonts
- Git configuration

## Prerequisites

- macOS operating system
- Administrator privileges
- Internet connection
- Command Line Tools for Xcode (will be installed if not present)

## What Gets Installed

### Applications (via Homebrew Cask)

- **Browsers & Communication**: Microsoft Edge, WhatsApp, Discord, Zoom, Microsoft Teams
- **Development**: Visual Studio Code, IntelliJ IDEA CE, GitHub Desktop, Docker
- **Productivity**: Alfred, Todoist, BusyCal, Rectangle, Anki
- **Media & Utilities**: Spotify, Background Music, AdGuard

### Development Tools

- Git
- Python 3
- OpenJDK 21
- Maven
- Yarn
- PostgreSQL
- Azure CLI
- AWS CLI
- OpenShift CLI

### Python Packages

Data science and development tools including: pipenv, Pillow, NumPy, Pandas, Requests, SciPy, scikit-learn, TensorFlow, BeautifulSoup4, Matplotlib, Seaborn, Bokeh, and optimize-images.

### Node.js Packages

- create-react-app
- create-react-native-app
- expo-cli

### VS Code Extensions

- Python
- React Native Tools
- TypeScript
- C#
- Prettier
- IntelliCode

### Fonts

San Francisco, New York, and Roboto font families for development and design work.

## Usage

1. **Download the script**
   ```bash
   curl -O [script-url]
   chmod +x setup.sh
   ```

2. **Customize (Optional)**
   
   Edit the arrays at the top of the script to add or remove applications, tools, or packages according to your needs.

3. **Run the script**
   ```bash
   ./setup.sh
   ```

4. **Wait for completion**
   
   The script will take some time to complete depending on your internet connection and system performance.

## What the Script Does

1. **Homebrew Installation/Update**: Checks for Homebrew and installs or updates it
2. **Tap Repositories**: Adds necessary Homebrew repositories
3. **Install Applications**: Installs all GUI applications to `/Applications`
4. **Install Development Tools**: Installs command-line tools and programming languages
5. **Install Package Managers**: Sets up pip, npm, and related packages
6. **Configure Java**: Sets up Java 21 environment variables in `.zshrc`
7. **Install Xcode Tools**: Ensures Command Line Tools are installed
8. **Git Configuration**: Configures Git with user information and preferences
9. **Cleanup**: Removes temporary files and caches

## Git Configuration

The script configures Git with the following settings:

- User name: Anthony Salib
- Email: asalib02@gmail.com
- Credential helper: macOS Keychain
- Pull strategy: Merge (not rebase)
- Global gitignore file

**⚠️ Important**: Update the Git configuration section with your own name and email before running the script.

## Post-Installation

After the script completes:

1. Restart your terminal or run `source ~/.zshrc` to load environment variables
2. Install any work-specific applications manually
3. Configure individual applications as needed
4. Sign in to applications that require authentication

## Configuration Files

The script copies the following configuration files to your home directory (ensure these files exist in the same directory as the script):

- `.zshenv`
- `.vimrc`
- `.gitignore_global`
- `.gitconfig`

## Troubleshooting

- **Permission Errors**: Run with `sudo` if you encounter permission issues (though most operations shouldn't require it)
- **Installation Failures**: Check your internet connection and try running the specific failed command manually
- **Homebrew Issues**: Run `brew doctor` to diagnose Homebrew problems
- **Path Issues**: Restart your terminal after installation to ensure PATH variables are loaded

## Notes

- The script uses `pip3` and Python 3 by default
- Java 21 is set as the default JAVA_HOME
- VS Code must be installed and available in PATH for extension installation to work
- Some applications may require additional setup or licensing after installation

## Customization

To customize the installation, modify the arrays at the beginning of the script:

- `casks`: GUI applications
- `brew`: Command-line tools
- `pip`: Python packages
- `npm`: Node.js packages
- `vscode`: VS Code extensions
- `fonts`: Fonts to install

## License

This script is provided as-is for personal use. Modify as needed for your environment.