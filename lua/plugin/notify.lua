local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local notifyMod = modLoader.loadModule('notify')

  if notifyMod.loaded then

    notifyMod.module.setup({
      stages = "fade_in_slide_out", -- animation style
      on_open = nil,
      on_close = nil,
      render = "default", -- notify-render()
      timeout = 5000, --ms
      max_width = nil, --columns
      max_height = nil, --lines
      background_colour = "Normal", -- RGB hex "#000000" or a function that returns that
      minimum_width = 50, --columns

      -- Default notify icons
      --[[
      icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
      },
      ]]
    })

    -- Set Notify as the default notification engine
    -- Can show notifications via vim.notify('message', 'log_level')
    vim.notify = notifyMod.module

  end
end

return M
