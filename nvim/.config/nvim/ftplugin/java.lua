-- ~/.config/nvim/ftplugin/java.lua

local jdtls = require 'jdtls'

local capabilities = require('blink.cmp').get_lsp_capabilities()
-- create bundles array from mason packages
local function get_jdtls_bundles()
  local bd = {}
  local mason_data = vim.fn.stdpath 'data' .. '/mason/packages'
  -- java debug adapter jars
  for _, p in ipairs(vim.split(vim.fn.glob(mason_data .. '/java-debug-adapter/extension/server/*.jar'), '\n')) do
    if #p > 0 then
      table.insert(bd, p)
    end
  end
  -- optional: java-test jars (useful for debugging junit/test)
  for _, p in ipairs(vim.split(vim.fn.glob(mason_data .. '/java-test/extension/server/*.jar'), '\n')) do
    if #p > 0 then
      table.insert(bd, p)
    end
  end
  return bd
end
local bundles = get_jdtls_bundles()
local config = {
  cmd = { vim.fn.exepath 'jdtls' }, -- use Mason's installed jdtls
  root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
  settings = {
    java = {},
  },
  init_options = {
    bundles = bundles,
  },
}
-- merge if you already have other capabilities
config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})

jdtls.start_or_attach(config)
jdtls.setup_dap { hotcodereplace = 'auto' }
