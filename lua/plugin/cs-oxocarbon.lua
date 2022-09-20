local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.cmd([[colorscheme oxocarbon-lua]])

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.plugin')

  if(colorTweaks.loaded) then
   --vim.cmd[[IncreaseContrast 0.2]]
  end

end

return M
