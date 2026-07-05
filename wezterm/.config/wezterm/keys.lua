local wezterm = require 'wezterm'

local M = {}

function M.apply(config)
  config.keys = { -- default: built-in key table (replaces defaults when set)
    { key = 'c', mods = 'SUPER', action = wezterm.action.CopyTo 'Clipboard' },
    { key = 'v', mods = 'SUPER', action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 't', mods = 'SUPER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = 'SUPER', action = wezterm.action.CloseCurrentPane { confirm = true } },
    { key = 'n', mods = 'SUPER', action = wezterm.action.SpawnWindow },
    { key = '+', mods = 'SUPER', action = wezterm.action.IncreaseFontSize },
    { key = '-', mods = 'SUPER', action = wezterm.action.DecreaseFontSize },
    { key = '0', mods = 'SUPER', action = wezterm.action.ResetFontSize },

    { key = 'd', mods = 'SUPER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'D', mods = 'SUPER|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

    { key = 'LeftArrow', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Down' },

    { key = '[', mods = 'SUPER|SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
    { key = ']', mods = 'SUPER|SHIFT', action = wezterm.action.ActivateTabRelative(1) },
  }
end

return M
