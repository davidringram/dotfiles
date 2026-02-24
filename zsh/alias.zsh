# ------------------------------------------------------------------------------
# ALIASES (The Shortcuts)
# ------------------------------------------------------------------------------

# --- Navigation & Core Core ---
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"
alias h="history"
alias lg="lazygit"

# --- Modern Replacements (eza & bat) ---
# Use 'eza' for a better 'ls' experience with icons
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias list="eza -lAh --git"
alias cat="bat"

# --- Safety Net ---
# Asks for confirmation before doing something destructive
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# --- Development Power Tools ---
# The "Port Killer" (When localhost:3000 says it's already in use)
alias killport="npx kill-port"
# The "React Fixer" (Nuke node_modules and reinstall)
alias nuke="rm -rf node_modules package-lock.json pnpm-lock.yaml && pnpm install"
# The "Git Fixer" (Start the repo over)
alias gitfix="rm -rf .git && git init"

# --- System & Package Management ---
# Keep the system fresh (Homebrew + Node)
alias refresh="brew update && brew upgrade && brew cleanup && fnm install --lts"
# Homebrew bundle dump
alias bbd='brew bundle dump --force --describe'
# Nuke Adobe/Mac Junk files recursively
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# --- Git Shortcuts ---
alias g="git"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"

# --- Media Tools (yt-dlp) ---
# Download video as highest quality MP4
alias ytv='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
# Download just the audio as an MP3
alias yta='yt-dlp -x --audio-format mp3'

# --- The "Fun" Stuff ---
# Watch Star Wars in the terminal
alias sw="telnet towel.blinkenlights.nl"
