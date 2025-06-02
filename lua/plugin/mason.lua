local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local masonMod = modLoader.loadModule('mason')
  local mcMod = modLoader.loadModule('mason-lspconfig')
  local lcMod = modLoader.loadModule('lspconfig')

  if masonMod.loaded and mcMod.loaded and lcMod.loaded then
    masonMod.module.setup({
      log_level = vim.log.levels.DEBUG,
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mcMod.module.setup({
      ensure_installed = {
        "lua_ls",
        --"jdtls",
        --"omnisharp",
        "csharp_ls",
      },
      automatic_installation = true,
      automatic_enable = true
    })
  end
end

return M
