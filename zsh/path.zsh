# PATH configuration
# Order matters: earlier entries take precedence

# =============================================================================
# User Binaries
# =============================================================================
# Local user binaries (typically installed manually or via pip --user, etc.)
export PATH="$HOME/.local/bin:$PATH"

# Personal scripts and utilities
export PATH="$HOME/bin:$PATH"

# =============================================================================
# Development Tools
# =============================================================================
# jenv - Java environment manager
export PATH="$HOME/.jenv/bin:$PATH"

# LM Studio CLI (lms)
export PATH="$PATH:/Users/loganwick/.lmstudio/bin"
