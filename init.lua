-- Enables profiling of setup if installed from plugins.lua
local modLoader = require('utils.moduleLoader')

local impatientMod = modLoader.loadModule('impatient', false)
if impatientMod.loaded then
  impatientMod.module.enable_profile()
end

require('plugins').loadPlugins() -- Load Packer config
require('opts') -- Load opts first due to dependencies on termguicolors
--require('mappings') -- Loading mappings has moved into lua/plugins/whichkey.lua
