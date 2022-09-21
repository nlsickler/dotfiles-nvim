local modLoader = require('utils.moduleLoader')
local monokai = require('monokai')

local M = {}

M.config = function()

--  vim.cmd([[colorscheme monokai_pro]])

  -- monokai.setup()
  -- monokai.setup { palette = monokai.pro }
  -- monokai.setup { palette = monokai.soda }
  -- monokai.setup { palette = monokai.ristretto }

  local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

  if(colorTweaks.loaded) then
    -- vim.cmd[[IncreaseContrast 0.3]]
  end

end

return M
