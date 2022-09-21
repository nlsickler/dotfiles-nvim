local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.g.space_nvim_transparent_bg = true

--  vim.cmd([[colorscheme space-nvim]])

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

  if(colorTweaks.loaded) then
    -- vim.cmd[[IncreaseContrast 0.3]]
  end

end

return M
