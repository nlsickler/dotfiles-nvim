-- Enables profiling of setup if installed from plugins.lua
local modLoader = require('utils.moduleLoader')

local impatientMod = modLoader.loadModule('impatient', false)
if impatientMod.loaded then
  impatientMod.module.enable_profile()
end

require('opts') -- Load opts first due to dependencies on termguicolors
require('plugins').loadPlugins() -- Load Packer config
--require('mappings') -- Loading mappings has moved into lua/plugins/whichkey.lua
