local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()

  vim.cmd("let g:LargeFile=2")

end

return M

