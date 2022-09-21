local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
    local bufMod = modLoader.loadModule('bufferline')

    if bufMod.loaded then

        bufMod.module.setup {
            options = {
                separator_style = "slant",
                numbers = "ordinal",
                max_name_length = 22,
                diagnostics = 'nvim_lsp',
            },
        }

    end
end

return M
