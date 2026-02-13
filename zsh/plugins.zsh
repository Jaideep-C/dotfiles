# Plugin configurations
# This file handles post-load configuration for plugins

# =============================================================================
# fzf - Fuzzy Finder
# =============================================================================
# Load fzf after oh-my-zsh to ensure it loads after zsh-vi-mode
# This prevents zsh-vi-mode from overriding fzf's Ctrl+R keybinding
if [[ -d /opt/homebrew/opt/fzf ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
else
  echo "%F{yellow}Warning: fzf not found. Fuzzy search (Ctrl+R) will not work.%f"
  echo "%F{yellow}Install with: brew install fzf%f"
fi
