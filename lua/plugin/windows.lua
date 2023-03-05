local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local windowsMod = modLoader.loadModule('windows')

  if windowsMod.loaded then
    windowsMod.module.setup()
  end
end

return M
