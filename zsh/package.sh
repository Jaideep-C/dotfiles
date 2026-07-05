# shellcheck shell=bash
# shellcheck disable=SC2034  # consumed by run_package in lib/dotfiles.sh
brew=(git fzf)

post_link() {
  local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log "installing oh-my-zsh"
    KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || {
      log_error "failed to install oh-my-zsh"
      return 1
    }
  else
    log "oh-my-zsh already installed, skipping"
  fi

  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-vi-mode" ]; then
    log "cloning zsh-vi-mode plugin"
    mkdir -p "$ZSH_CUSTOM/plugins"
    git clone https://github.com/jeffreytse/zsh-vi-mode "$ZSH_CUSTOM/plugins/zsh-vi-mode" || {
      log_error "failed to clone zsh-vi-mode"
      return 1
    }
  else
    log "zsh-vi-mode already present, skipping"
  fi
}
