local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local npairsMod = modLoader.loadModule('nvim-autopairs')

  if npairsMod.loaded then

    --Configures nvim-autopairs to use treesitter
    npairsMod.module.setup({
      check_ts = true,
    })

  end

end

return M
