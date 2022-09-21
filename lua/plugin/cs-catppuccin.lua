local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
    vim.g.catppuccin_flavour = "mocha" -- Light to Dark: latte, frappe, macchiato, mocha

    -- vim.cmd([[colorscheme catppuccin]])

    local cs = modLoader.loadModule('catppuccin')

    if cs.loaded then
        cs.module.setup()
    end

    local colorTweaks = modLoader.loadModule('colorscheme-tweaks.core')

    if colorTweaks.loaded then
        -- vim.cmd([[IncreaseContrast 0.2]])
    end

end

return M
