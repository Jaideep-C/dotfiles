# WezTerm

Modular [WezTerm](https://wezfurlong.org/wezterm/) config (appearance, behavior, keys).

## Stow target

`~/.config/wezterm`

## Brew

casks: `wezterm`, `font-jetbrains-mono-nerd-font`

## Layout

```
wezterm/
├── package.sh
└── .config/wezterm/
    ├── wezterm.lua        # entry — requires the modules below
    ├── appearance.lua     # font, Dracula, window chrome
    ├── behavior.lua       # shell, scrollback, visual bell
    └── keys.lua           # Super-based shortcuts
```

## Notes

- Default shell: `/bin/zsh -l`.
- Font: JetBrainsMono Nerd Font; color scheme: Dracula.
- Tab bar disabled; native macOS fullscreen.
- Super shortcuts for copy/paste, tabs, splits (`d` / `Shift-d`), and pane focus (arrows).
