
alias antigravity='open -a "Google Antigravity"'

# Added by Antigravity
export PATH="/Users/davidingram/.antigravity/antigravity/bin:$PATH"

eval "$(fnm env --use-on-cd)"

eval "$(starship init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set Variables
export MANPAGER="sh -c 'col -bx | bat -p -lman'"

# Create Aliases (From ZSH Course) 
alias lst="ls -lAh"

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

#Music Shortcuts
alias mute="killall mpv"
alias lofi='mpv --no-video "https://www.youtube.com/watch?v=jfKfPfyJRdk" &'
alias japanesecafe='mpv --no-video "https://www.youtube.com/watch?v=bRnTGwCbr3E" &'
alias rainlofi='mpv --no-video "https://www.youtube.com/watch?v=vYIYIVmOo3Q" &'
alias darkfantasy='mpv --no-video "https://www.youtube.com/watch?v=UrfOxtLiBCI" &'
alias retrogame='mpv --no-video "https://www.youtube.com/watch?v=3Q_S7tTICFY" &'
alias synthwave='mpv --no-video "https://www.youtube.com/watch?v=4xDzrJKXOOY" &'
alias cozyrain='mpv --no-video "https://www.youtube.com/watch?v=XtFvoAXGHlo" &'
alias chrono='mpv --no-video "https://www.youtube.com/watch?v=q1OtMEV4PfM" &'
alias tavern='mpv --no-video "https://www.youtube.com/watch?v=vK5VwVyxkbI" &'
alias ghibli='mpv --no-video "https://www.youtube.com/watch?v=gIWsboTllGA" &'
alias campfire='mpv --no-video "https://www.youtube.com/watch?v=KLL26li4Gjo" &'
alias camping='mpv --no-video "http://youtube.com/watch?v=oDdVHn5Pvm0" &'

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

# Weather API for CLI Reports
export WEATHER_API_KEY="{{ .weather_key | default "free_version" }}"