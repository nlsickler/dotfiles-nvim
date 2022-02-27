local modLoader = require('utils.moduleLoader')

LL_audio_lastUpdate = 0
LL_audio_retry_interval = 10
LL_audio_lastValue = 'No Music'

local M = {}

M.config = function()

  local luaMod = modLoader.loadModule('lualine')

  if luaMod.loaded then

    local function ts_status()
      local tsMod = modLoader.loadModule('nvim-treesitter')

      if not tsMod.loaded then
        return
      end

      return tsMod.module.statusline(90)
    end

    local function audio_status()
      if (os.time() - LL_audio_lastUpdate) > 10 then
        LL_audio_retry_interval = 10
        LL_audio_lastUpdate = os.time()
        local systemResult = vim.fn.system({'spt', 'pb', '-s', '-f', '%t - %a'}) -- Needs to be run async
        LL_audio_lastValue = '🎵 '..string.sub(systemResult, 1, -2) -- Terminal call appends two characters which break lualine

        if string.find(LL_audio_lastValue, "no context") then
          -- No music is running.  Back off system calls for 1 minute
          LL_audio_retry_interval = 60
          LL_audio_lastValue = '🔇 No Music'
        end

        vim.notify(LL_audio_lastValue..LL_audio_retry_interval, 'info')
      end

      return LL_audio_lastValue
    end

    luaMod.module.setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
        {'filename',
            file_status = true,
            path = 1,
            shorting_target = 64,}
        },
        lualine_x = {ts_status, audio_status, 'encoding'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {}
    }

  end
end

return M
