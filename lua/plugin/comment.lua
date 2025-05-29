
local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local comment = modLoader.loadModule("Comment")

  if(comment.loaded) then
      comment.module.setup()
  end


end

return M
