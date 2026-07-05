local wezterm = require 'wezterm'
local config = wezterm.config_builder()

package.path = package.path .. ';' .. wezterm.config_dir .. '/?.lua'

require('appearance').apply(config)
require('behavior').apply(config)
require('keys').apply(config)

return config
