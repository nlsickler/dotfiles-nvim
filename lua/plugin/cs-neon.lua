local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.g.neon_style = 'dark'
  vim.g.neon_italic_keyword = true
  vim.g.neon_italic_function = true
  vim.g.neon_transparent = true

--  vim.cmd([[colorscheme neon]])

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.plugin')

  if(colorTweaks.loaded) then
    -- vim.cmd[[IncreaseContrast 0.3]]
  end

end

return M
