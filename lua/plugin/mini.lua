local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local cw = modLoader.loadModule('mini.cursorword')

  if cw.loaded then
    cw.module.setup()
  end

  local bdel = modLoader.loadModule('mini.bufremove')

  if bdel.loaded then
    bdel.module.setup()
  end

  -- Disabilng mini.map because it msses up buffer and line col rendering
  --[[ local map = modLoader .loadModule('mini.map')

  if map.loaded then
    map.module.setup()
  end ]]

end

return M
