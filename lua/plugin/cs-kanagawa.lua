local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

    -- vim.cmd([[colorscheme kanagawa]])

    -- local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

    -- if colorTweaks.loaded then
    --     vim.cmd([[IncreaseContrast 0.05]])

    -- end

end

return M
