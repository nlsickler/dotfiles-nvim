local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local bufMod = modLoader.loadModule('bufferline')

  if bufMod.loaded then

    bufMod.module.setup{
      options = {
        separator_style = "slant",
        numbers = "ordinal",
        sort_by = 'directory',
        max_name_length = 22,
        persist_buffer_sort = true,
        diagnostics = 'nvim_lsp'
      }
    }

  end
end

return M
