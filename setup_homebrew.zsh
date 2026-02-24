#!/usr/bin/env zsh
echo "\n<<< Starting Homebrew setup >>>\n"

# Standard way to check for a command without needing your custom 'exists' function
if command -v brew >/dev/null 2>&1; then
    echo "Hey Pal! Homebrew is already installed."
else
    echo "brew does not exist, continuing with install..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Ensure brew is available in the current session after install
    if [[ "$(uname -m)" == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Run the bundle using the Brewfile in the same directory
echo "📦 Installing from Brewfile..."
brew bundle --verbose