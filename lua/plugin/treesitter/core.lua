local mLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local treesitterConf = mLoader.loadModule('nvim-treesitter.configs')
  local treesitterInst = mLoader.loadModule('nvim-treesitter.install')

  if treesitterInst.loaded then
      treesitterInst.module.compilers = { "clang" }
  end

  if treesitterConf.loaded then
    require('nvim-treesitter.install').compilers = {'clang'}

    -- Treesitter configuration
    treesitterConf.module.setup {
      ensure_installed = "all",

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
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          loockahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
          }
        }
      }
    }

    M.loadLanguageSettings('lua')
    M.loadLanguageSettings('c_sharp')
    M.loadLanguageSettings('jdtls')
  end
end

M.loadLanguageSettings = function(name)
  local module = mLoader.loadModule('plugin.treesitter.tsconf.'..name)

  if module.loaded then
    module.module.config()
  end
end

return M
