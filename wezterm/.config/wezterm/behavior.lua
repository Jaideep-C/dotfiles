local M = {}

function M.apply(config)
  config.default_prog = { '/bin/zsh', '-l' } -- default: $SHELL

  config.scrollback_lines = 10000 -- default: 3500
  config.enable_scroll_bar = false -- default: false

  config.audible_bell = 'Disabled' -- default: SystemBeep
  config.visual_bell = { -- default: fade durations 0, easing Ease
    fade_in_function = 'EaseIn', -- default: Ease
    fade_in_duration_ms = 150, -- default: 0
    fade_out_function = 'EaseOut', -- default: Ease
    fade_out_duration_ms = 150, -- default: 0
  }

  config.automatically_reload_config = true -- default: true
end

return M
