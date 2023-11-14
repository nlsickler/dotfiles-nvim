local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local indentMod = modLoader.loadModule('ibl')

  if indentMod.loaded then
    indentMod.module.setup {
    }
  end

end

return M
