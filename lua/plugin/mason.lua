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
    })

    -- Provides a default configuration for LSP servers (and allows for specification of custom configs)
    -- Largely, this allows for servers to be used without having to update the config for each server (meaning they can be used without restarting nvim)
    require("mason-lspconfig").setup_handlers {
      function (server_name)
        lcMod.module[server_name].setup {
          root_dir = function() return require('lspconfig/util').find_git_ancestor(vim.fn.getcwd()) end,
        }
      end,

      ["omnisharp"] = function ()
        lcMod.module["omnisharp"].setup {
          root_dir = require('lspconfig/util').root_pattern("*.sln", "*.csproj", ".git")
        }
      end,

      ["omnisharp_mono"] = function ()
        lcMod.module["omnisharp_mono"].setup {
          root_dir = require('lspconfig/util').root_pattern("*.sln", "*.csproj", ".git")
        }
      end,

      ["csharp_ls"] = function ()
        lcMod.module["csharp_ls"].setup {
          root_dir = require('lspconfig/util').root_pattern("*.sln", "*.csproj", ".git")
        }
      end,

      ["lua_ls"] = function()
        lcMod.module["lua_ls"].setup {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim', 'use' }
              },
            }
          }
        }
      end,

      ["harper_ls"] = function()
        lcMod.module["harper_ls"].setup {
          root_dir = function() return require('lspconfig/util').find_git_ancestor(vim.fn.getcwd()) end,
        }
      end,

      ["ast_grep"] = function()
        lcMod.module["ast_grep"].setup {
          root_dir = function() return require('lspconfig/util').find_git_ancestor(vim.fn.getcwd()) end,
        }
      end,

      -- ["jdtls"] = function()
      --   lcMod.module["jdtls"].setup {
      --     root_dir = function() return require('lspconfig/util').find_git_ancestor(vim.fn.getcwd()) end,
      --   }
      -- end,
    }
  end
end

return M
