# ------------------------------------------------------------------------------
# CUSTOM FUNCTIONS (The Force Multipliers)
# ------------------------------------------------------------------------------

# 1. Environment Lab Switcher
# Usage: 'py-lab'
function py-lab() {
  # 🏷️ 1. Set the Name (Default to 'lab' if no name is provided)
  local ENV_NAME=${1:-lab}
  local DATA_DIR="$HOME/Documents/Analytics/Python/$ENV_NAME"

  # 📂 2. Navigate to & Create Project Folder
  mkdir -p "$DATA_DIR"
  cd "$DATA_DIR" || return

  # 🛠️ 3. Create Conda Env if it doesn't exist
  if ! conda info --envs | grep -q "$ENV_NAME"; then
    echo "🏗️ Environment '$ENV_NAME' not found. Building it now..."
    conda create -n "$ENV_NAME" python=3.11 pandas numpy matplotlib seaborn scikit-learn jupyterlab -y
  fi

  # 🐍 4. Activate & Launch
  conda activate "$ENV_NAME"
  
  echo "📓 Starting Jupyter Lab for project: $ENV_NAME"
  jupyter lab > /dev/null 2>&1 & disown
  
  echo "✅ Active Environment: $ENV_NAME"
  python --version
}

# 2. Astro Project Scaffolder
# Usage: 'astro my-project-name'
# Logic: Health checks the registry, sets pnpm retries, and adds Tailwind/Alpine.
function astro() {
  if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    return 1
  fi

  # 📂 0. Navigate to your Workspace
  # Change this path to wherever you want your Astro projects to live
  local BASE_DIR="$HOME/Documents/Development/Astro"
  mkdir -p "$BASE_DIR"
  cd "$BASE_DIR" || return

  # 🔐 1. Load your secure token for the install
  export NPM_TOKEN=$(security find-generic-password -a "$USER" -s "NPM_TOKEN" -w 2>/dev/null)

  # 📡 2. Pre-flight Registry Check
  echo "📡 Checking npm registry status..."
  if ! curl -s --head --request GET https://registry.npmjs.org/ | grep "200 OK" > /dev/null; then
    echo "⚠️ Registry is unstable (503). Switching to --prefer-offline mode..."
    local OFFLINE_FLAG="--prefer-offline"
  fi

  echo "🚀 Creating Astro project: $1 in $BASE_DIR..."
  pnpm create astro@latest "$1" -- --template basics --install --git --yes $OFFLINE_FLAG || {
    echo "❌ PNPM failed."
    return 1
  }
  
  cd "$1" || return

  echo "🎨 Installing Tailwind..."
  pnpm astro add tailwind --yes $OFFLINE_FLAG

  echo "🏔️ Installing Alpine.js..."
  pnpm astro add alpinejs --yes $OFFLINE_FLAG

  # 🛠️ 3. Create the .gemini directory (Fixed comment syntax)
  mkdir -p .gemini

  # 📝 4. Write the settings.json
  cat <<EOF > .gemini/settings.json
{
  "general": {
    "previewFeatures": true
  }
}
EOF

  echo "✅ Done! Project $1 is ready at $(pwd)"

  code .
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

function rproj() {
  # 1. Define path
  local PROJ_PATH="$HOME/Documents/Analytics/R_Projects/$1"
  
  # 2. Create the folder structure
  mkdir -p "$PROJ_PATH/data" "$PROJ_PATH/scripts" "$PROJ_PATH/output"
  
  # 3. Create a clean .Rproj file manually (Prevents the 'moved/deleted' error)
  cat > "$PROJ_PATH/$1.Rproj" <<EOF
Version: 1.0

RestoreWorkspace: No
SaveWorkspace: No
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: pdfLaTeX
EOF

  # 4. Open in RStudio
  open -a RStudio "$PROJ_PATH/$1.Rproj"
  
  echo "🚀 Project '$1' created at $PROJ_PATH"
}