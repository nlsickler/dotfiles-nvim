local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.g.tokyonight_style = 'night'
  --vim.cmd([[colorscheme tokyonight]])

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

  if(colorTweaks.loaded) then
    --vim.cmd[[IncreaseContrast 0.3]]
  end

end

return M
