local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

  vim.cmd([[colorscheme oxocarbon-lua]])

  if(colorTweaks.loaded) then
    vim.cmd([[IncreaseContrast 0.1]])
  end

end

return M
