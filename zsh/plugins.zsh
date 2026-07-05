# Plugin configurations
# This file handles post-load configuration for plugins

# =============================================================================
# fzf - Fuzzy Finder
# =============================================================================
# zsh-vi-mode lazy-inits on the first prompt and overwrites keybindings.
# Register zvm_after_init here so fzf loads after vi-mode init, once .zshrc
# has finished sourcing.
function zvm_after_init() {
  if [[ -d /opt/homebrew/opt/fzf ]]; then
    source /opt/homebrew/opt/fzf/shell/completion.zsh
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  else
    echo "%F{yellow}Warning: fzf not found. Fuzzy search (Ctrl+R) will not work.%f"
    echo "%F{yellow}Install with: brew install fzf%f"
  fi
}
