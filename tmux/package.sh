# shellcheck shell=bash
# shellcheck disable=SC2034  # consumed by run_package in lib/dotfiles.sh
brew=(tmux git)
casks=(font-jetbrains-mono-nerd-font)

post_link() {
  local TPM_DIR="$HOME/.tmux/plugins/tpm"
  local TMUX_PLUGINS_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/plugins"

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

  if [ ! -d "$TMUX_PLUGINS_DIR/tmux" ] && [ -x "$TPM_DIR/bin/install_plugins" ]; then
    log "installing tmux plugins"
    "$TPM_DIR/bin/install_plugins" || {
      log_error "failed to install tmux plugins"
      return 1
    }
  else
    log "tmux plugins already present, skipping"
  fi
}
