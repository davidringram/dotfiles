# ------------------------------------------------------------------------------
# PATH & ENVIRONMENT VARIABLES
# ------------------------------------------------------------------------------

# 1. System Paths
# Add Antigravity (Custom CLI)
export PATH="/Users/davidingram/.antigravity/antigravity/bin:$PATH"

# Add Bun (JavaScript Runtime)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Add LM Studio (Local AI CLI)
export PATH="$PATH:/Users/davidingram/.lmstudio/bin"

# 2. Tool Configurations (Exports)
# Use 'bat' as the pager for Man pages (makes them readable/colored)
export MANPAGER="sh -c 'col -bx | bat -p -lman'"

# Disable macOS "Quarantine" for Homebrew Casks (removes the "Are you sure?" popup)
export HOMEBREW_CASK_OPTS="--no-quarantine"

# 3. pnpm Retry Logic (for flaky connections during Astro builds)
export PNPM_CONFIG_FETCH_RETRIES=5
export PNPM_CONFIG_FETCH_RETRY_MAXTIMEOUT=60000

