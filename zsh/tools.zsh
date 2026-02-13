# External tools integration
# This file handles initialization and configuration for development tools

# =============================================================================
# Docker
# =============================================================================
# Docker Desktop CLI completions
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=($HOME/.docker/completions $fpath)
fi

# =============================================================================
# Python - pyenv
# =============================================================================
# Python version manager
if command -v pyenv &> /dev/null; then
  eval "$(pyenv init -)"
fi

# =============================================================================
# Java - jenv
# =============================================================================
# Java version manager
if command -v jenv &> /dev/null; then
  eval "$(jenv init -)"
  jenv enable-plugin maven
fi

# =============================================================================
# Kubernetes - kubebuilder
# =============================================================================
# kubebuilder autocompletion
if command -v kubebuilder &> /dev/null; then
  source <(kubebuilder completion zsh)
fi

# =============================================================================
# Completion System
# =============================================================================
# Initialize completion system (must be done after modifying fpath)
autoload -Uz compinit
compinit
