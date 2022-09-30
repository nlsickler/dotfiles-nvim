local modLoader = require('utils.moduleLoader')

local M = {}

M.servers = {
  [ 'bashls' ] = {},
  [ 'clangd' ] = {},
  [ 'pyright' ] = {},
  [ 'sumneko_lua' ] = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'use' }
        },
      }
    }
  },
  [ 'powershell_es' ] = {},
  [ 'ltex' ] = {},
  [ 'omnisharp' ] = { root_dir = require('lspconfig/util').root_pattern('*.sln') },
  [ 'spectral' ] = {},
}

M.config = function()

  local masonMod = modLoader.loadModule('mason')

  if masonMod.loaded then
    masonMod.module.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
  end
end

return M
