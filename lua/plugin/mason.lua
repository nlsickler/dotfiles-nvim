local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local masonMod = modLoader.loadModule('mason')
  local mcMod = modLoader.loadModule('mason-lspconfig')
  local lcMod = modLoader.loadModule('lspconfig')

  if masonMod.loaded and mcMod.loaded and lcMod.loaded then
    masonMod.module.setup({
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
        "sumneko_lua",
        "omnisharp",
      },
      automatic_installation = true,
    })

    -- Provides a default configuration for LSP servers (and allows for specification of custom configs)
    -- Largely, this allows for servers to be used without having to update the config for each server (meaning they can be used without restarting nvim)
    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup {}
      end,

      ["omnisharp"] = function ()
        require("lspconfig")["omnisharp"].setup {
          root_dir = require('lspconfig/util').root_pattern("*.sln", "*.csproj", ".git")
        }
      end,

      ["omnisharp_mono"] = function ()
        require("lspconfig")["omnisharp_mono"].setup {
          root_dir = require('lspconfig/util').root_pattern("*.sln", "*.csproj", ".git")
        }
      end,

      ["sumneko_lua"] = function()
        require("lspconfig")["sumneko_lua"].setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim', 'use' }
              },
            }
          }
        }
      end
    }


  end
end

return M
