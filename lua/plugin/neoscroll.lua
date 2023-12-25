local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local neoscrollMod = modLoader.loadModule('neoscroll')

  if neoscrollMod.loaded then

    neoscrollMod.module.setup({
      easing_function = 'circular'
    })

  end
end

return M
