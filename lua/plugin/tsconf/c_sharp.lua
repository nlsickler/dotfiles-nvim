local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  local queryMod = modLoader.loadModule('vim.treesitter.query')

  if queryMod.loaded then

    local folds = [[ 
body: [
  (declaration_list)
  (switch_body)
  (enum_member_declaration_list)
] @fold

accessors: [
  (accessor_list)
] @fold

initializer: [
  (initializer_expression)
] @fold

(method_declaration) @fold
(block) @fold
]]

    queryMod.module.set_query("c_sharp", 'folds', folds)
  end
end

return M
