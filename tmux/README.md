# tmux

tmux config with TPM plugins (Dracula theme, resurrect, scratch popup).

## Stow target

`~/.config/tmux`

## Brew

- formulae: `tmux`, `git`
- cask: `font-jetbrains-mono-nerd-font`

## Layout

```
tmux/
├── package.sh             # post_link installs TPM + plugins
└── .config/tmux/
    └── tmux.conf
```

## Notes

- **Prefix:** `Ctrl-s` (not `Ctrl-b`). Reload: `prefix + r`.
- Vim pane keys: `hjkl`.
- New splits/windows inherit the current pane's cwd.
- Plugins (via TPM into `~/.tmux/plugins/`):
  - `dracula/tmux`
  - `tmux-plugins/tmux-resurrect`
  - `momo-lab/tmux-toggle-scratch` — toggle with `prefix + \``
- Install/update plugins: `prefix + I`.
- Local `plugins/` under this package is gitignored; TPM owns runtime installs.
