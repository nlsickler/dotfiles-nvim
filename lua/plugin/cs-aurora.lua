local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.g.aurora_italic = 1
  vim.g.aurora_transparent = 1
  vim.g.aurora_bold = 1
  vim.g.aurora_darker = 1

--  vim.cmd([[colorscheme aurora]])

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.plugin')

  if(colorTweaks.loaded) then
    -- vim.cmd[[IncreaseContrast 0.3]]
  end

end

return M
