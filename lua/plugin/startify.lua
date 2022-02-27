local ustr = require('utils.strings')
local M = {}

vim.cmd("let g:startify_custom_header = ['                          _         ', '   ____  ___  ____ _   __(_)___ ___ ', '  / __ \\/ _ \\/ __ \\ | / / / __ `__ \\', ' / / / /  __/ /_/ / |/ / / / / / / /', '/_/ /_/\\___/\\____/|___/_/_/ /_/ /_/ ']")

M.getSessionName = function()
  local gitPath = vim.fn.system({'git', 'rev-parse', '--show-toplevel'})
  local repoName = vim.fn.fnamemodify(gitPath, ':t')
  local branchName = vim.fn.system({'git', 'rev-parse', '--abbrev-ref', 'HEAD'})

  if ustr.StartsWith(repoName, 'fatal:') or ustr.StartsWith(branchName, 'fatal:') then
    return 'no-project'
  end

  return string.gsub(repoName..'_'..branchName, '\n', '')
end

M.createSession = function()
  local command = 'SSave! '..M.getSessionName()

  --print(command)
  vim.cmd(command)
end


M.config = function()
  vim.cmd('autocmd VimLeavePre * lua require("plugin.startify").createSession()')
end

return M
