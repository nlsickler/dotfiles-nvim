local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
    local ttermMod = modLoader.loadModule('toggleterm')

    if ttermMod.loaded then

        ttermMod.module.setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = nil,
        })

    end

end

return M
