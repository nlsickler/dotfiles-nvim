local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local queryMod = modLoader.loadModule('vim.treesitter.query')

  if queryMod.loaded then

  end
end

return M

