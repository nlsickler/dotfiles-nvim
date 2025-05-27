local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local cp = modLoader.loadModule("copilot")
  local cpPanel = modLoader.loadModule("copilot.panel")
  local cpSuggest = modLoader.loadModule("copilot.suggestion")

  if cp.loaded then
    cp.module.setup({

    })
  end

end

return M
