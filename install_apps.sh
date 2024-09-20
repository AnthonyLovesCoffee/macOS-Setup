# Check for Homebrew,
# Install if we don't have it
if [[ $(command -v brew) == "" ]]; then
  echo "Installing Hombrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Updating Homebrew"
  brew update
fi

# Software list
casks=(
  microsoft-edge
  whatsapp
  spotify
  discord
  zoom
  microsoft-teams
  github
  visual-studio-code
  intellij-idea-ce
  docker
  background-music
  alfred
  todoist
  busycal
  rectangle
  anki
  adguard
)

# Tools list
brew=(
  git
  python
  openjdk@21
  maven
  yarn
  postgresql
  azure-cli
  awscli
  openshift-cli
)

# Python packages list
pip=(
  pipenv
  Pillow
  optimize-images
  numpy
  pandas
  requests
  scipy
  scikit-learn
  tensorflow
  beautifulsoup4
  matplotlib
  seaborn
  bokeh
)

# Node packages list
npm=(
  create-react-app
  create-react-native-app
  expo-cli
)

# VS-Code extension list
vscode=(
  ms-python.python
  msjsdiag.vscode-react-native
  ms-vscode.vscode-typescript-next
  ms-dotnettools.csharp
  esbenp.prettier-vscode
  visualstudioexptteam.vscodeintellicode
)

# Fonts list
fonts=(
  font-roboto
  font-roboto-mono
  font-sf-pro
  font-sf-compact
  font-sf-mono
  font-new-york
)

# Initiate Homebrew casks
brew tap 'homebrew/cask'
brew tap 'homebrew/cask-fonts'

# Installing Software list
echo "Installing apps..."
for i in "${casks[@]}"
do
   :
   brew install --cask --appdir="/Applications" $i
done

# Installing Tools list
echo "Installing Dev languages & packages..."
for i in "${brew[@]}"
do
   :
   brew install $i
done

# Installing Python packages list
echo "Installing Python packages & frameworks..."
for i in "${pip[@]}"
do
   :
   pip3 install $i
done

# Installing Ruby packages list
echo "Installing Ruby tools..."
for i in "${gem[@]}"
do
   :
   gem install $i
done

# Installing Node packages list
echo "Installing Node frameworks..."
for i in "${npm[@]}"
do
   :
   npm install -g $i
done

# Installing VS-Code extension list
echo "Installing VS Code extensions..."
for i in "${vscode[@]}"
do
   :
   code --install-extension $i
done

# Installing fonts
echo "Installing fonts..."
for i in "${fonts[@]}"
do
   :
   brew install --cask $i
done

# Setting up Java environment variables
echo "Setting up Java environment variables..."
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v21)' >> ~/.zshrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc

# Source the updated .zshrc file
source ~/.zshrc

# Verifying Java installation
echo "Verifying Java installation..."
java -version
javac -version

# Verifying Maven installation
echo "Verifying Maven installation..."
mvn -version

# Setting-up XCode
echo "Installing XCode-stuff..."
xcode-select --install

# Git configuration
echo "Configuring Git..."
cp .zshenv ~/
cp .vimrc ~/
cp .gitignore_global ~/
cp .gitconfig ~/
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "Anthony Salib"
git config --global user.email "asalib02@gmail.com"
git config --global credential.helper osxkeychain
git config --global pull.rebase false

# Cleanup
echo "Cleaning up..."
brew cleanup
rm -f -r /Library/Caches/Homebrew/*

echo "Done! Please install other apps, including work related apps & tools manually"