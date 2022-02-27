local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local bufMod = modLoader.loadModule('bufferline')

  if bufMod.loaded then

    bufMod.module.setup{
      options = {
        numbers = "ordinal"
      }
    }

  end
end

return M
