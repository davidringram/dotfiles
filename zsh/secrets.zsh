# ------------------------------------------------------------------------------
# PATH & ENVIRONMENT VARIABLES
# ------------------------------------------------------------------------------
echo "Secrets are online!"

# Load NPM Token securely from macOS Keychain
export NPM_TOKEN=$(security find-generic-password -a "$USER" -s "NPM_TOKEN" -w 2>/dev/null)