local M = {}

M.tablePopulated = next

M.isLoaded = function(module)
  return M.tablePopulated(module) and module.loaded
end

M.loadModule = function(moduleName, shouldNotify) local status_ok, mod = pcall(require, moduleName)
  if shouldNotify == nil then
    shouldNotify = true
  end

  if not status_ok then
    mod = nil
    if shouldNotify then
      vim.notify('Cannot load '..moduleName, 'warn')
    end
  end

  return {
    loaded = status_ok,
    module = mod
  }
end

return M
