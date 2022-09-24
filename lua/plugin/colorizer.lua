local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local colorMod = {}
  colorMod = modLoader.loadModule('colorizer')

  if colorMod.loaded then
    colorMod.module.setup({
      'css';
      'javascript';
      'html';
    },
    {
      css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode     = 'background'; -- Set the display mode. (foreground or background)
    }
    )

  end
end

return M
