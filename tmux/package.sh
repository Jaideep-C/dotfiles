# shellcheck shell=bash
# shellcheck disable=SC2034  # consumed by run_package in lib/dotfiles.sh
brew=(tmux git)
casks=(font-jetbrains-mono-nerd-font)

post_link() {
  # TPM installs into ~/.tmux/plugins (not the stowed ~/.config/tmux/plugins).
  local TPM_DIR="$HOME/.tmux/plugins/tpm"

  if [ ! -d "$TPM_DIR" ]; then
    log "installing tpm"
    mkdir -p "$(dirname "$TPM_DIR")"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR" || {
      log_error "failed to clone tpm"
      return 1
    }
  else
    log "tpm already installed, skipping"
  fi

  # Idempotent: only clones plugins listed in tmux.conf that are missing.
  if [ -x "$TPM_DIR/bin/install_plugins" ]; then
    log "installing missing tmux plugins"
    "$TPM_DIR/bin/install_plugins" || {
      log_error "failed to install tmux plugins"
      return 1
    }
  fi
}
