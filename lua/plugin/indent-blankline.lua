local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local indentMod = modLoader.loadModule('indent_blankline')

  if indentMod.loaded then
    indentMod.module.setup {
      show_current_context = true,
      show_current_context_start = true,
      show_end_of_line = true,
      space_char_blankline = " "
    }
  end

end

return M
