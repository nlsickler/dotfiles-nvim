local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local sigMod = modLoader.loadModule('lsp_signature')

  if(sigMod.loaded) then

    sigMod.module.setup({
      always_trigger = true, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
    })
  end

end

return M
