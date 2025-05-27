local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local persistence = modLoader.loadModule("persistence")

  if persistence.loaded then

    persistence.module.setup({
      need = 1,
      branch = true,
    })

  end

end

return M

