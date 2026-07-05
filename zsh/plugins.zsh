# Plugin configurations
# This file handles post-load configuration for plugins

# =============================================================================
# fzf - Fuzzy Finder
# =============================================================================
# zsh-vi-mode lazy-inits on the first prompt and overwrites keybindings, so on
# a *cold* shell start we load fzf via zvm_after_init, which fires once vi-mode
# has finished its init. But that hook only fires on the shell's very first
# prompt - if .zshrc is re-sourced later (e.g. `source ~/.zshrc`), vi-mode's
# first-prompt event has already fired and won't fire again, so the hook never
# reruns and Ctrl+R silently falls back to zsh's native bck-i-search. Loading
# fzf here too (in addition to the hook) covers that re-source case, since at
# that point vi-mode is already done and won't override the bindings again.
function zvm_after_init() {
  __load_fzf
}

function __load_fzf() {
  if [[ -d /opt/homebrew/opt/fzf ]]; then
    source /opt/homebrew/opt/fzf/shell/completion.zsh
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  else
    echo "%F{yellow}Warning: fzf not found. Fuzzy search (Ctrl+R) will not work.%f"
    echo "%F{yellow}Install with: brew install fzf%f"
  fi
}
__load_fzf
