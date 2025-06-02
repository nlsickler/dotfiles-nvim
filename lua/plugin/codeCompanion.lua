local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local cc = modLoader.loadModule("codecompanion")

  if cc.loaded then
    cc.module.setup({
      strategies = {
        chat = {
          adapter = "copilot",
        },
      },
      opts = {
        log_level = "DEBUG",
      },
    })
  end

end

return M

