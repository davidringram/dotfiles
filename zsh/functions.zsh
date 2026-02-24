# ------------------------------------------------------------------------------
# CUSTOM FUNCTIONS (The Force Multipliers)
# ------------------------------------------------------------------------------

# 1. Environment Lab Switcher
# Usage: 'lab'
# Logic: Checks for a local .venv first; otherwise, activates the master lab.
lab() {
  if [[ -f "./.venv/bin/activate" ]]; then
    source ./.venv/bin/activate
    echo "📂 Project Environment Active"
  else
    source ~/.venv/bin/activate
    echo "🧠 Master Data Lab Active 🚀"
  fi
  python --version
}

# 2. Astro Project Scaffolder
# Usage: 'astro-init my-project-name'
# Logic: Health checks the registry, sets pnpm retries, and adds Tailwind/Alpine.
function astro-init() {
  if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    return 1
  fi

  # 🔐 1. Load your secure token for the install
  export NPM_TOKEN=$(security find-generic-password -a "$USER" -s "NPM_TOKEN" -w 2>/dev/null)

  # 📡 2. Pre-flight Registry Check
  echo "📡 Checking npm registry status..."
  if ! curl -s --head --request GET https://registry.npmjs.org/ | grep "200 OK" > /dev/null; then
    echo "⚠️ Registry is unstable (503). Switching to --prefer-offline mode..."
    local OFFLINE_FLAG="--prefer-offline"
  fi

  echo "🚀 Creating Astro project: $1..."
  # We use the token and the potential offline flag here
  pnpm create astro@latest "$1" -- --template basics --install --git --yes $OFFLINE_FLAG || {
    echo "❌ PNPM failed. The registry might be fully locked down."
    return 1
  }
  
  cd "$1" || return

  echo "🎨 Installing Tailwind..."
  pnpm astro add tailwind --yes $OFFLINE_FLAG

  echo "🏔️ Installing Alpine.js..."
  pnpm astro add alpinejs --yes $OFFLINE_FLAG

  echo "✅ Setup Complete!"
  echo "📂 Project: $1"
  
  echo "💥 Dropping gravity..."
  agy .
}

# 3. Directory Creator & Jumper
# Usage: 'mkcd new-folder'
function mkcd () {
    mkdir -p "$@" && cd "$_";
}

# 4. M4 Deep Maintenance
# Usage: 'clean_mac'
# Logic: Purges snapshots, clears cache/logs, flushes DNS, and prunes Docker.
function clean_mac() {
    echo "🔄 Updating Homebrew index..."
    brew update
    
    echo "🧹 Starting system deep-clean..."
    
    # Homebrew & Caches
    brew cleanup --prune=all
    brew autoremove
    rm -rf ~/Library/Caches/* 2>/dev/null
    rm -rf ~/Library/Logs/* 2>/dev/null
    
    # Local Time Machine Snapshots (Reclaims 'System Data')
    echo "⏳ Purging local snapshots..."
    for snapshot in $(tmutil listlocalsnapshots / | awk -F. '{print $4}'); do
        sudo tmutil deletelocalsnapshots "$snapshot" 2>/dev/null
    done

    # Development Bloat (Xcode & .DS_Store)
    if [ -d ~/Library/Developer/Xcode/DerivedData ]; then
        rm -rf ~/Library/Developer/Xcode/DerivedData/*
    fi
    find ~ ~/Desktop ~/Documents ~/Downloads -maxdepth 3 -name ".DS_Store" -print -delete 2>/dev/null

    # Network & Spotlight
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
    sudo mdutil -E / 2>/dev/null

    # Containers
    docker system prune -af --volumes
    
    # Trash & Scripts
    rm -rf ~/.Trash/* 2>/dev/null
    sudo periodic daily weekly monthly

    echo "✅ Done! Your M4 is now lean and mean!"
    fastfetch
}

# 5. NPM Token Loader
# Usage: 'load-npm'
# Logic: Pulls the token from macOS Keychain and exports it for the session.
function load-npm() {
  export NPM_TOKEN=$(security find-generic-password -a "$USER" -s "NPM_TOKEN" -w 2>/dev/null)
  echo "🔑 NPM_TOKEN loaded into session."
}