#!/usr/bin/env zsh
echo "\n<<< Starting Homebrew setup >>>\n"

if exists brew; then
    echo "Hey Pal! Homebrew is already installed."
else
    echo "brew does not exist, continuing with install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose