local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local queryMod = modLoader.loadModule('vim.treesitter.query')

  if queryMod.loaded then

    local folds = [[ [
  (function_declaration)
  (function_definition)
  (table_constructor)
] @fold ]]

    queryMod.module.set_query("lua", 'folds', folds)

  end
end

return M
