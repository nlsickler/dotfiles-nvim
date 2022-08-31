local moduleLoader = require('utils.moduleLoader')

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
  local lspInstallerMod = moduleLoader.loadModule('nvim-lsp-installer')

  if lspInstallerMod.loaded then
    local lsp_installer = lspInstallerMod.module

    for name, _ in ipairs(M.servers) do
      local server_is_found, server = lsp_installer.get_server(name)
      if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
      end
    end

    lsp_installer.on_server_ready(function(server)
      local moduleLoader = require('utils.moduleLoader')
      local aerialMod = moduleLoader.loadModule('aerial')

      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      local opts = require('plugin.nvim-lsp-installer').servers[server.name]

      if(opts ~= nil) then
        opts['capabilities'] = capabilities

        if aerialMod.loaded then
          opts['on_attach'] = aerialMod.module.on_attach
        end

        server:setup(opts)
      end
    end)
  end
end

return M
