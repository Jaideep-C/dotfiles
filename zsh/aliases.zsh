# Shell aliases

# =============================================================================
# Configuration Editing
# =============================================================================
# Edit main zsh configuration
alias zshconfig="nvim ~/.zshrc"

# Edit specific configuration modules
alias zshconfig-all="nvim ~/.config/zsh/*.zsh ~/.zshrc"
alias zshconfig-aliases="nvim ~/.config/zsh/aliases.zsh"
alias zshconfig-path="nvim ~/.config/zsh/path.zsh"
alias zshconfig-options="nvim ~/.config/zsh/options.zsh"
alias zshconfig-plugins="nvim ~/.config/zsh/plugins.zsh"
alias zshconfig-tools="nvim ~/.config/zsh/tools.zsh"
alias zshconfig-omz="nvim ~/.config/zsh/oh-my-zsh.zsh"

# Edit Oh My Zsh installation
alias ohmyzsh="nvim ~/.oh-my-zsh"

# =============================================================================
# Terminal Management
# =============================================================================
# Clear terminal and scrollback buffer (iTerm2 compatible)
alias clear='printf "\033]1337;ClearScrollback\a" && clear'

# =============================================================================
# Directory Navigation
# =============================================================================
# Pop directory from stack (shorter than 'popd')
alias pd='popd'

# =============================================================================
# Kubernetes
# =============================================================================
alias k='kubectl'

# =============================================================================
# Development Workflows
# =============================================================================
alias redeploy='make undeploy deploy'
