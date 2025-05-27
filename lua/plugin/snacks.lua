local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local snack = modLoader.loadModule("snacks")

  if snack.loaded then

    snack.module.setup({
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      image = { enabled = false},
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    })

  end

end

return M

