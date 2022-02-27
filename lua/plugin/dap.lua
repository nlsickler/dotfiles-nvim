local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local dapModule = modLoader.loadModule('dap')

  if dapModule.loaded then
    local dap = dapModule.module


    -- NetCoreDbg {{{1
    dap.adapters.netcoredbg = {
      type = 'executable',
      command = 'netcoredbg', -- Assumes netcoredbg is on the path
      args = {'--interpreter=vscode'}
    }

    dap.configurations.cs = {
    {
        type = "netcoredbg",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input('netcoredbg', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }
  end
  -- 1}}}

end

return M
