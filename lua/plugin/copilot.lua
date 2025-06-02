local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local cp = modLoader.loadModule("copilot")
  local cpCmp = modLoader.loadModule("copilot_cmp")

  --[[ if cp.loaded then
    cp.module.setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end

  -- Adds copilot suggestions to nvim-cmp for completion
  if cpCmp.loaded then
    cpCmp.module.setup({

    })
  end ]]

end

return M
