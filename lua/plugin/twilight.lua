local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

    local twilightMod = modLoader.loadModule('twilight')

    if twilightMod.loaded then

        twilightMod.module.setup {
            dimming = {
                alpha = 0.25,
                inactive = true,
            },
            context = 99,
            treesitter = true,
            exclude = {
                "startify",
            },
        }
    end
end

return M
