# Aerospace

[AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) tiling window manager for macOS (i3-like).

## Stow target

`~/.config/aerospace`

## Brew

- cask: `nikitabobko/tap/aerospace`

## Layout

```
aerospace/
├── package.sh
└── .config/aerospace/
    └── .aerospace.toml
```

## Notes

- Starts at login (`start-at-login = true`).
- Vim-style focus/move: `alt-hjkl` / `alt-shift-hjkl`.
- Workspaces: `alt-1`…`alt-9` and letter workspaces (`alt-a`…`alt-z`); move node with `alt-shift-*`.
- Layout toggle: `alt-slash` (tiles), `alt-comma` (accordion).
- Resize: `alt-minus` / `alt-equal`.
