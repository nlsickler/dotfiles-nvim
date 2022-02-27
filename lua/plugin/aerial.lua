local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local aerialMod = modLoader.loadModule('aerial')

  if aerialMod.loaded then
    aerialMod.module.setup({
      backends = { 'lsp', 'treesitter'},
      show_guides = true,
      manage_folds = true,
      -- link_folds_to_tree = true,
      -- link_tree_to_folds = true,
    })

    local telescopeMod = modLoader.loadModule('telescope')
    if telescopeMod.loaded then
      telescopeMod.module.load_extension('aerial')
    end
  end
end

return M
