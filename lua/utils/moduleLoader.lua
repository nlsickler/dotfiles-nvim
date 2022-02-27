local M = {}

M.tablePopulated = next

M.isLoaded = function(module)
  return M.tablePopulated(module) and module.loaded
end

M.loadModule = function(moduleName) local status_ok, mod = pcall(require, moduleName)

  if not status_ok then
    mod = nil
    vim.notify('Cannot load '..moduleName, 'warn')
  end

  return {
    loaded = status_ok,
    module = mod
  }
end

return M
