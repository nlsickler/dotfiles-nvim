local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local snack = modLoader.loadModule("snacks")

  if snack.loaded then

    local Snacks = snack.module

    snack.module.setup({
      bigfile = { enabled = true },
      dashboard = {
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1, limit = 4 },
            { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1, limit = 8 },
            {
              pane = 2,
              icon = " ",
              title = "Git Status",
              section = "terminal",
              enabled = function()
                return Snacks.git.get_root() ~= nil
              end,
              cmd = "git status --short --branch --renames",
              height = 5,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            },
            { section = "startup" },
          },
        },
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

