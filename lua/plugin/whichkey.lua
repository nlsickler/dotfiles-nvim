local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local wkMod = modLoader.loadModule('which-key')

  if wkMod.loaded then

    wkMod.module.setup({
    })

    -- This actually performs all of the mappings
    require('mappings')

  end
end

return M
