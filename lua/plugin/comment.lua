local modLoader = require('utils.moduleLoader')

-- Comment configuration
local M = {}

function M.config()
  local comMod = modLoader.loadModule('Comment')

  if comMod.loaded then
    comMod.module.setup(
    {
      padding = true, -- Adds space between comment and line
      sticky = true, -- Keep cursor in current location
      ignore = nil, -- Lines to ignore (@Type string:Regex)

      -- LHS of toggle mappings in NORMAL + VISUAL mode
      toggler = {
        line = 'gcc', -- Current line line comment
        block = 'gbc', -- Current line block Comment
      },
      -- VISUAL mode
      opleader = {
        line = 'gc',  -- Line Comment
        block = 'gb', -- Block Comment
      },
      -- LHS of extra mappings
      extra = {
        above = 'gcO', -- Add comment on line above
        below = 'gco', -- Add comment on line below
        eol = 'gcA', -- Append comment
      },

      -- These mappings can be changed individually by `opleader` and `toggler` config
      mappings = {
        basic = true, -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        extra = true, -- Includes `gco`, `gcO`, `gcA`
        extended = false, -- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      },
      pre_hook = nil, -- @type fun(ctx)
      post_hook = nil, -- @type fun(ctx)
    }
    )
  end
end

return M
