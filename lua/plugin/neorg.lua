local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local neorg = modLoader.loadModule("neorg")

  if neorg.loaded then

    neorg.module.setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = { -- Adds pretty icons to your documents
          config = {
            icon_preset = "diamond"
          }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "C:\\Projects\\Personal\\notes\\neorg",
            },
            default_workspace = "notes"
          },
        },
        ["core.summary"] = {},
        -- ["core.tempus"] = {},
        -- ["core.ui.calendar"] = {},
      }
    }

  end

end

return M
