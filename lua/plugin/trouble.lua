local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local troubleMod = modLoader.loadModule('trouble')

  if troubleMod.loaded then
    troubleMod.module.setup({
      win = {
        type = "split",
        position = "right",
        size = 50,
      },
    })

  end
end

return M
