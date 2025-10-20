-- ~/.config/nvim/ftplugin/java.lua

local jdtls = require 'jdtls'

local capabilities = require('blink.cmp').get_lsp_capabilities()
local config = {
  cmd = { vim.fn.exepath 'jdtls' }, -- use Mason's installed jdtls
  root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
  settings = {
    java = {},
  },
  init_options = {
    bundles = {}, -- we'll fill this later with java-debug jars
  },
}
-- merge if you already have other capabilities
config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})

jdtls.start_or_attach(config)
