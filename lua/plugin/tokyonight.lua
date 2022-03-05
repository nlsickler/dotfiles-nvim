local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.g.tokyonight_style = 'storm'
  vim.cmd([[colorscheme tokyonight]])

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks')

  if(colorTweaks.loaded) then
    vim.cmd([[IncreaseContrast 0.2]])
  end

end

return M
