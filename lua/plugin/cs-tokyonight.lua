local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  -- vim.cmd([[colorscheme tokyonight-night]])

  -- local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

  -- if(colorTweaks.loaded) then
  --  vim.cmd[[IncreaseContrast 0.1]]
  -- end

end

return M
