local ustr = require('utils.strings')
local M = {}

vim.cmd("let g:startify_custom_header = ['                          _         ', '   ____  ___  ____ _   __(_)___ ___ ', '  / __ \\/ _ \\/ __ \\ | / / / __ `__ \\', ' / / / /  __/ /_/ / |/ / / / / / / /', '/_/ /_/\\___/\\____/|___/_/_/ /_/ /_/ ']")

M.getSessionName = function()
  local gitPath = vim.fn.system({'git', 'rev-parse', '--show-toplevel'})
  local repoName = vim.fn.fnamemodify(gitPath, ':t')

  if ustr.StartsWith(repoName, 'fatal:') then
    return 'no-project'
  end

  return repoName
end

M.createSession = function()
  local command = 'SSave! '..M.getSessionName()

  vim.cmd(command)
end


M.config = function()
  vim.cmd([[autocmd VimLeavePre * lua require("plugin.startify").createSession()]])

  if vim.o.filetype == "lazy" then
      vim.cmd.close()
  end
end

return M
