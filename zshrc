echo "welcome to the shell baby!"

# Added by Antigravity
export PATH="/Users/davidingram/.antigravity/antigravity/bin:$PATH"

eval "$(fnm env --use-on-cd)"

eval "$(starship init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set Variables
export MANPAGER="sh -c 'col -bx | bat -p -lman'"
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Create Aliases (From ZSH Course) 
alias list="eza -lAh --git"

# Customize Prompts

# Add Locations to $PATH Variables

# Write Handy Functions
function mkcd () {
    mkdir -p "$@" && cd "$_";
    }

# Use ZSH Plugins

# ... Other Surprises

#Added by zoxide
eval "$(zoxide init zsh)"

# 1. The "Port Killer" (When localhost:3000 says it's already in use)
alias killport="npx kill-port"

# 2. The "React Fixer" (When node_modules gets corrupted)
alias nuke="rm -rf node_modules package-lock.json pnpm-lock.yaml && pnpm install"

# 3. The "Git Fixer" (When git gets corrupted)
alias gitfix="rm -rf .git && git init"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nuke Adobe/Mac Junk files recursively
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

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

#Music Shortcuts 100% and 50%
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

# Astro + Tailwind + React + Alpine (PNPM) -> Ends with Antigravity
function astro-init() {
  if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    return 1
  fi

  echo "🚀 Creating new Astro project with PNPM: $1..."
  pnpm create astro@latest "$1" -- --template basics --install --git --yes
  
  cd "$1" || return

  echo "🎨 Installing Tailwind & React..."
  pnpm astro add tailwind react --yes

  echo "🏔️ Installing Alpine.js..."
  pnpm astro add alpinejs --yes

  echo "✅ Setup Complete!"
  echo "📂 Project created at: $1"
  
  echo "💥 Dropping gravity..."
  
  # FORCE the shell to run the command exactly as if you typed it
  agy .
}

# Start shell with dragon
fortune | cowsay -f dragon

# Watch Star Wars Quotes
alias sw="telnet towel.blinkenlights.nl"


#self-clean system
# Custom God-Tier Cleanup Script
clean() {

    echo "🔄 Updating Homebrew tools first..."
    brew update && brew upgrade  # This ensures we have the new versions
    
    echo "🧹 Starting system deep-clean..."
    
    # 1. Homebrew Cleanup
    echo "📦 Cleaning Homebrew..."
    brew cleanup -s
    brew autoremove
    
    # 2. Clear User Caches (Safe)
    echo "🗂️  Clearing User Caches..."
    rm -rf ~/Library/Caches/*
    
    # 3. Purge Local Time Machine Snapshots (The 'System Data' culprit)
    echo "⏳ Purging local Time Machine snapshots..."
    tmutil listlocalsnapshots / | awk -F. '{print $4}' | xargs -n1 tmutil deletelocalsnaeagle85pshots 2>/dev/null
    
    # 4. Flush DNS
    echo "🌐 Flushing DNS cache..."
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
    
    # 5. Empty Trash (Optional - remove if you prefer doing it manually)
    echo "🗑️  Emptying Trash..."
    rm -rf ~/.Trash/*

    echo "✅ Done! Your M4 is now lean and mean."
    fastfetch
}

# bun completions
[ -s "/Users/davidingram/.bun/_bun" ] && source "/Users/davidingram/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

