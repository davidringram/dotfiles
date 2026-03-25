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


# 🚀 God Tier R Project Creator
# Usage: mkR my_new_project
mkR() {
  # 1. Validation & Variable Setup
  if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    echo "Usage: mkR project_name"
    return 1
  fi

  local PROJ_NAME=$1
  local PROJ_BASE="$HOME/Documents/Analytics/R_Projects"
  local PROJ_PATH="$PROJ_BASE/$PROJ_NAME"

  # Prevent overwriting an existing project
  if [ -d "$PROJ_PATH" ]; then
    echo "⚠️  Directory already exists: $PROJ_PATH"
    return 1
  fi

  # 2. Structure & Directory Setup
  echo "📁 Creating folder structure at $PROJ_PATH..."
  mkdir -p "$PROJ_PATH/data" "$PROJ_PATH/scripts" "$PROJ_PATH/output"
  
  # Create .gitkeep files so empty folders are tracked by Git
  touch "$PROJ_PATH/data/.gitkeep" "$PROJ_PATH/scripts/.gitkeep" "$PROJ_PATH/output/.gitkeep"
  
  cd "$PROJ_PATH" || return

  # 3. Create .Rproj File (Best Practice Settings)
  echo "📄 Generating .Rproj config..."
  cat > "$PROJ_NAME.Rproj" <<EOF
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

  # 4. Initialize Git & .gitignore
  echo "🔧 Initializing Git..."
  git init -q
  cat > .gitignore <<EOF
.Rproj.user
.Rhistory
.RData
.Ruserdata
.DS_Store
# Data/Output safety (keeps structure, ignores files)
data/*
!data/.gitkeep
output/*
!output/.gitkeep
# Renv library
renv/library/
renv/staging/
EOF

  # 5. Initialize renv
  echo "📦 Initializing renv (this may take a moment)..."
  Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv', repos='https://cloud.r-project.org'); renv::init(bare = TRUE)"

  # 6. Create initial lockfile
  echo "📸 Creating initial lockfile..."
  Rscript -e "renv::snapshot(confirm = FALSE)"

  # 7. GitHub Repository Creation
  if command -v gh &> /dev/null; then
    echo "🚀 Creating Private GitHub repository..."
    git add .
    git commit -m "Initial project structure"
    gh repo create "$PROJ_NAME" --private --source=. --remote=origin --push
  else
    echo "⚠️  GitHub CLI (gh) not found. Skipping repo creation."
  fi

  # 8. Launch RStudio
  echo "🎨 Opening in RStudio..."
  open -a RStudio "$PROJ_NAME.Rproj"
  
  echo "✅ Project '$PROJ_NAME' is ready to rock!"
}