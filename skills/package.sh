# shellcheck shell=bash
# shellcheck disable=SC2034  # consumed by run_package in lib/dotfiles.sh
# shellcheck source=skill-targets.sh
source "$DOTFILES_DIR/skills/skill-targets.sh"
stow_targets=("${skill_targets[@]}")
