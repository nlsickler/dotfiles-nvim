local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local retrailMod = modLoader.loadModule('retrail')

  if retrailMod.loaded then

    retrailMod.module.setup({
            filetype = {
                strict = false,
                exclude = {
                    "",
                    "alpha",
                    "checkhealth",
                    "diff",
                    "help",
                    "lspinfo",
                    "man",
                    "mason",
                    "startify",
                    "TelescopePrompt",
                    "Trouble",
                    "WhichKey",
                }
            }
        })

    end
end

return M
