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

  local comm = modLoader.loadModule('mini.comment')

  if comm.loaded then
    comm.module.setup({
      options = {
        ignore_blank_line = true,
      }
    })
  end



  -- local colors = modLoader.loadModule('mini.colors')

  -- if colors.loaded then
  --   colors.module.setup()
  -- end

  -- local hues = modLoader.loadModule('mini.hues')
  -- if hues.loaded then
  --   hues.module.setup({background = '#24283b', foreground = '#c0ccff', n_hues = 8, saturation = 'high'})
  -- end



  -- Disabilng mini.map because it msses up buffer and line col rendering
  -- local map = modLoader .loadModule('mini.map')

  -- if map.loaded then
  --   map.module.setup()
  -- end

end

return M
