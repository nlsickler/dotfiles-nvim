local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local noiceMod = modLoader.loadModule('noice')

  if noiceMod.loaded then

    noiceMod.module.setup({
      cmdline = {
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
        icons = {
          ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
          ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
          [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
        },
      },
      history = {
        -- options for the message history that you get with `:Noice`
        view = "vsplit",
        opts = { enter = true },
        filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
      },
      throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
    })

  end
end

return M
