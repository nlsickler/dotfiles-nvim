local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

    local bqfMod = modLoader.loadModule('bqf')

    if bqfMod.loaded then

        bqfMod.module.setup()

    end

end

return M
