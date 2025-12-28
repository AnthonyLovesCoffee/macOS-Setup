#!/bin/bash

echo "Installing Packages & Extensions"

pip_packages=(
    pipenv
    numpy
    pandas
    requests
    python-dotenv
    scipy
    scikit-learn
    tensorflow
    beautifulsoup4
    matplotlib
    seaborn
    plotly
    tqdm
    bokeh
    yarl
    Flask
    Django
)

npm_packages=(
    create-react-app
    create-react-native-app
    expo-cli
    typescript
    dotenv
)

vscode_extensions=(
    anthropic.claude-code
    docker.docker
    mechatroner.rainbow-csv
    ms-python.python
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    msjsdiag.vscode-react-native
    ms-vscode.vscode-typescript-next
    esbenp.prettier-vscode
    vscjava.vscode-gradle
    vscjava.vscode-java-debug
    vscjava.vscode-java-dependency
    vscjava.vscode-java-pack
    vscjava.vscode-java-test
    vscjava.vscode-java-upgrade
    zhucy.project-tree
    jirkavrba.subway-surfers
    johnpapa.vscode-peacock
    ms-vsliveshare.vsliveshare
    ritwickdey.liveserver
)

echo "Installing Python packages..."
for package in "${pip_packages[@]}"
do
    echo "Installing $package..."
    pip3 install "$package"
done

echo "Installing Node.js packages..."
for package in "${npm_packages[@]}"
do
    echo "Installing $package..."
    npm install -g "$package"
done

if command -v code &> /dev/null; then
    echo "Installing VS Code extensions..."
    for extension in "${vscode_extensions[@]}"
    do
        echo "Installing $extension..."
        code --install-extension "$extension"
    done
else
    echo "  VS Code not found in PATH. Skipping extension installation."
    echo "  Run this script again after VS Code is properly installed."
fi

echo "Package installation complete!"
echo ""