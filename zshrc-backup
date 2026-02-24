# Added by Antigravity --- add binaries to the start of the PATH for custom CLI tools.
export PATH="/Users/davidingram/.antigravity/antigravity/bin:$PATH"

# Initialize fnm and enable automatic Node.js version switching on directory change.
eval "$(fnm env --use-on-cd)"

# Initialize the Starship customizable shell prompt.
eval "$(starship init zsh)"

# Load Zsh plugins for auto-suggestions and syntax highlighting.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################
############################ DOTFILES COURSE ###################################
################################################################################

# Set Variables
export MANPAGER="sh -c 'col -bx | bat -p -lman'"
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Create Aliases (From ZSH Course) 
alias list="eza -lAh --git"
alias bbd='brew bundle dump --force --describe'

# Customize Prompts

# Add Locations to $PATH Variables

# Write Handy Functions
# makes a folder and goes to it
function mkcd () {
    mkdir -p "$@" && cd "$_";
    }

# Use ZSH Plugins

# ... Other Surprises

################################################################################

#Added by zoxide
eval "$(zoxide init zsh)"

# 1. The "Port Killer" (When localhost:3000 says it's already in use)
alias killport="npx kill-port"

# 2. The "React Fixer" (When node_modules gets corrupted)
alias nuke="rm -rf node_modules package-lock.json pnpm-lock.yaml && pnpm install"

# 3. The "Git Fixer" (When git gets corrupted)
alias gitfix="rm -rf .git && git init"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Keep the system fresh
alias refresh="brew update && brew upgrade && brew cleanup && fnm install --lts"

# Modern ls replacements
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"

# Navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Safety first (asks before overwriting/deleting)
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Shortcuts``
alias c="clear"
alias h="history"
alias lg="lazygit"
alias cat="bat"

# Git Shortcuts
alias g="git"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"
alias gs="git status"

# Download video as highest quality MP4
alias ytv='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

# Download just the audio as an MP3
alias yta='yt-dlp -x --audio-format mp3'


################################################################################
########################## QUICK MUSIC (+ 50%) #################################
################################################################################

alias mute="killall mpv"
alias lofi='mpv --no-video "https://www.youtube.com/watch?v=jfKfPfyJRdk" &'
alias lofi50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=jfKfPfyJRdk" &'
alias jpcafe='mpv --no-video "https://www.youtube.com/watch?v=bRnTGwCbr3E" &'
alias jpcafe50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=bRnTGwCbr3E" &'
alias rainlofi='mpv --no-video "https://www.youtube.com/watch?v=vYIYIVmOo3Q" &'
alias rainlofi50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=vYIYIVmOo3Q" &'
alias darkfantasy='mpv --no-video "https://www.youtube.com/watch?v=UrfOxtLiBCI" &'
alias darkfantasy50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=UrfOxtLiBCI" &'
alias fantlofi='mpv --no-video "https://www.youtube.com/watch?v=OQtGTzWMAM8" &'
alias fantlofi50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=OQtGTzWMAM8" &'
alias retrogame='mpv --no-video "https://www.youtube.com/watch?v=3Q_S7tTICFY" &'
alias retrogame50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=3Q_S7tTICFY" &'
alias synthwave='mpv --no-video "https://www.youtube.com/watch?v=4xDzrJKXOOY" &'
alias synthwave50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=4xDzrJKXOOY" &'
alias cozyrain='mpv --no-video "https://www.youtube.com/watch?v=XtFvoAXGHlo" &'
alias cozyrain50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=XtFvoAXGHlo" &'
alias rpg='mpv --no-video "https://www.youtube.com/watch?v=lDU7SvjlhFw" &'
alias rpg50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=lDU7SvjlhFw" &'
alias finalfantasy='mpv --no-video "https://www.youtube.com/watch?v=QI0xIx6_2Dc" &'
alias finalfantasy50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=QI0xIx6_2Dc" &'
alias tavern='mpv --no-video "https://www.youtube.com/watch?v=vK5VwVyxkbI" &'
alias tavern50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=vK5VwVyxkbI" &'
alias ghibli='mpv --no-video "https://www.youtube.com/watch?v=gIWsboTllGA" &'
alias ghibli50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=gIWsboTllGA" &'
alias campfire='mpv --no-video "https://www.youtube.com/watch?v=KLL26li4Gjo" &'
alias campfire50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=KLL26li4Gjo" &'
alias bluegrass='mpv --no-video "https://www.youtube.com/watch?v=p9NxcfZQung" &'
alias bluegrass50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=p9NxcfZQung" &'
alias newage='mpv --no-video "https://www.youtube.com/watch?v=6OZpV5bbIwY" &'
alias newage50='mpv --no-video --volume=50 "https://www.youtube.com/watch?v=6OZpV5bbIwY" &'

################################################################################
############################# CUSTOM BUILDS#####################################
################################################################################

#enviroment lab() with smart switch
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

function astro-init() {
  if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    return 1
  fi

  # 🔍 STEP 1: Health Check (The "Is the Internet Alive?" test)
  echo "📡 Checking npm registry status..."
  if ! curl -s --head  --request GET https://registry.npmjs.org/ | grep "200 OK" > /dev/null; then
    echo "🚫 Registry is down (503/404). Grab a coffee and try again in 10 mins."
    return 1
  fi

  # 🛠️ STEP 2: Set Retry Policy (Temporary for this session)
  export PNPM_CONFIG_FETCH_RETRIES=5
  export PNPM_CONFIG_FETCH_RETRY_MAXTIMEOUT=60000

  echo "🚀 Creating new Astro project: $1..."
  pnpm create astro@latest "$1" -- --template basics --install --git --yes || return 1
  
  cd "$1" || return

  echo "🎨 Adding Tailwind..."
  # Use --prefer-offline to use local cache if the registry flickers
  pnpm astro add tailwind --yes --prefer-offline

  echo "🏔️ Adding Alpine.js..."
  pnpm astro add alpinejs --yes --prefer-offline

  echo "✅ Setup Complete!"
  echo "💥 Dropping gravity..."
  agy .
}

################################################################################
############################### FUN STUFF ######################################
################################################################################

# Start shell with dragon
fortune | cowsay -f dragon

# Watch Star Wars Quotes
alias sw="telnet towel.blinkenlights.nl"

# bun completions
[ -s "/Users/davidingram/.bun/_bun" ] && source "/Users/davidingram/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/davidingram/.lmstudio/bin"
# End of LM Studio CLI section

################################################################################
############################ CLEAN UP FILES ####################################
################################################################################

# Nuke Adobe/Mac Junk files recursively
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# clean_mac function
function clean_mac() {
    echo "🔄 Updating Homebrew index..."
    brew update
    
    echo "🧹 Starting system deep-clean..."
    
    # 1. Homebrew Cleanup
    echo "📦 Cleaning Homebrew cache and old versions..."
    brew cleanup --prune=all
    brew autoremove
    
    # 2. Clear User Caches
    echo "🗂️  Clearing User Caches..."
    rm -rf ~/Library/Caches/* 2>/dev/null

    # 3. Clear System Logs
    echo "📝 Clearing User Logs..."
    rm -rf ~/Library/Logs/* 2>/dev/null
    
    # 4. Purge Local Time Machine Snapshots (Reclaims 'System Data')
    echo "⏳ Purging local snapshots..."
    for snapshot in $(tmutil listlocalsnapshots / | awk -F. '{print $4}'); do
        sudo tmutil deletelocalsnapshots "$snapshot" 2>/dev/null
    done

    # 5. Clear Xcode Derived Data
    if [ -d ~/Library/Developer/Xcode/DerivedData ]; then
        echo "🛠️  Clearing Xcode Derived Data..."
        rm -rf ~/Library/Developer/Xcode/DerivedData/*
    fi
    
    # 6. Advanced .DS_Store Cleanup
    # This searches your Home, Desktop, Downloads, and your Marketing Hub specifically
    echo "📂 Removing .DS_Store files (Targeted Search)..."
    # We use -print to show you what's happening, then -delete to kill it
    find ~ ~/Desktop ~/Documents ~/Downloads -maxdepth 3 -name ".DS_Store" -print -delete 2>/dev/null

    # 7. Flush DNS
    echo "🌐 Flushing DNS cache..."
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder

    # 8. Clear Spotlight Index (Fixes "Other" Storage)
    echo "🔍 Clearing Spotlight Index..."
    sudo mdutil -E / 2>/dev/null

    #9. clean docker/orbstack 
    docker system prune -af --volumes
    
    # 10. Empty Trash
    echo "🗑️  Emptying Trash..."
    rm -rf ~/.Trash/* 2>/dev/null

    # 11. Run System Maintenance Scripts
    echo "⚙️  Running macOS maintenance scripts..."
    sudo periodic daily weekly monthly

    echo "✅ Done! Your M4 is now lean and mean!"
    fastfetch
}

################################################################################