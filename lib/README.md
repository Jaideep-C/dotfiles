# lib

Shared helpers for the root `dotfiles.sh` orchestrator.

## Contents

- **`dotfiles.sh`** — package runner: logging, brew/cask install, stow/unstow, and `run_package` which sources each package's `package.sh` manifest.

## How packages use it

Each package directory declares a `package.sh` with optional:

| Variable / hook | Purpose |
|-----------------|---------|
| `brew` | Homebrew formulae |
| `casks` | Homebrew casks |
| `taps` | Homebrew taps |
| `stow_targets` | Stow destinations (default: `$HOME`) |
| `post_link` / `post_unlink` | Hooks after link/unlink |

`stow` is always installed. Certain files are never stowed (`package.sh`, `README.md`, `skill-targets.sh`, legacy `link.sh` / `unlink.sh`).

Not a stow package — sourced by `./dotfiles.sh` only.
