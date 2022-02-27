local mLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local treesitterConf = mLoader.loadModule('nvim-treesitter.configs')

  if treesitterConf.loaded then

    -- Treesitter configuration
    treesitterConf.module.setup {
      ensure_installed = "maintained",

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      indent = { enable = true, },
    }

    M.loadLanguageSettings('lua')
    M.loadLanguageSettings('c_sharp')
  end
end

M.loadLanguageSettings = function(name)
  local module = mLoader.loadModule('plugin.tsconf.'..name)

  if module.loaded then
    module.module.config()
  end
end

return M
