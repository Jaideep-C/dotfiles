# Neovim

Neovim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), with custom plugins under `lua/custom/`.

## Stow target

`~/.config/nvim`

## Brew

`neovim`, `ripgrep`, `fd`, `git`, `cmake`

## Layout

```
nvim/
├── package.sh
└── .config/nvim/          # kickstart + custom/
    ├── init.lua
    ├── lua/custom/
    └── README.md          # upstream kickstart docs
```

## Notes

- Lazy.nvim installs plugins on first launch.
- Upstream kickstart docs live in `.config/nvim/README.md`.
- Customize via `lua/custom/plugins/` rather than editing kickstart core files when possible.
