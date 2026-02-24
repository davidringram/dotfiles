# ------------------------------------------------------------------------------
# SHELL PLUGINS & UI (The Look & Feel)
# ------------------------------------------------------------------------------

# 1. External Plugin Sources
# Load Zsh productivity plugins: ghost-text suggestions and command coloring.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load FZF (Fuzzy Finder) if it exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 2. Tool Initializations (The "Evals")
# Starship: The customizable prompt (Git status, Node version, etc.)
eval "$(starship init zsh)"

# zoxide: The smarter 'cd' (remembers your frequent directories)
eval "$(zoxide init zsh)"

# fnm: Node Version Manager with auto-switching on directory change
eval "$(fnm env --use-on-cd)"

# Bun: Shell completions
[ -s "/Users/davidingram/.bun/_bun" ] && source "/Users/davidingram/.bun/_bun"