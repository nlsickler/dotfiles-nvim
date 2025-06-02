local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local obsidian = modLoader.loadModule("obsidian")

  if obsidian.loaded then

    obsidian.module.setup({
      workspaces = {
        {
          name = "personal",
          path = "C:\\Projects\\Personal\\notes",
        },
        -- {
        --   name = "work",
        --   path = "D:\\Personal\\notes"
        -- },
      },
      daily_notes = {
        folder = "journals"
      },
      disable_frontmatter = true,
      templates = {
        folder = "templates"
      },
      ui = {
        enable = false,
      },
    })

  end

end

return M
