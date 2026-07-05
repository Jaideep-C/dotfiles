#!/usr/bin/env bash
set -uo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES_DIR
# shellcheck source=lib/dotfiles.sh
source "$DOTFILES_DIR/lib/dotfiles.sh"

init_log dotfiles

direction="${1:-}"
case "$direction" in
  link | unlink) shift ;;
  *)
    echo "Usage: dotfiles.sh <link|unlink> [package...]" >&2
    exit 2
    ;;
esac

packages=(nvim tmux aerospace wezterm zsh skills)
if [ "$#" -gt 0 ]; then
  packages=("$@")
fi

fail_count=0
for pkg in "${packages[@]}"; do
  log "${direction}ing $pkg"
  if ! run_package "$direction" "$pkg"; then
    fail_count=$((fail_count + 1))
  fi
  # run_package re-points log() at the package; restore orchestrator prefix.
  init_log dotfiles
done

if [ "$fail_count" -gt 0 ]; then
  log "done with $fail_count error(s)"
  exit 1
fi

log "done, all steps succeeded"
