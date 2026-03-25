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
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  pyenv() {
    unfunction pyenv
    eval "$(command pyenv init -)"
    pyenv "$@"
  }
fi

# =============================================================================
# Java - jenv
# =============================================================================
# Java version manager
if command -v jenv &> /dev/null; then
  eval "$(jenv init -)"
  [[ ! -e "$HOME/.jenv/plugins/maven" ]] && jenv enable-plugin maven
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
