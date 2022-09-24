local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  -- vim.cmd([[colorscheme github_dark_default]])

  local tweakMod = modLoader.loadModule('colorscheme-tweaks.core')

  if tweakMod.loaded then
      -- vim.cmd([[IncreaseContrast 0.1]])
  end

end

return M
