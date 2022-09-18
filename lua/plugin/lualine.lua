local modLoader = require('utils.moduleLoader')

LL_audio_lastUpdate = 0
LL_audio_retry_interval = 10
LL_audio_currValue = 'No Music'
LL_audio_lastValue = 'No Music'

local M = {}

M.config = function()

  local luaMod = modLoader.loadModule('lualine')

  if luaMod.loaded then

    local function audio_status()
      if (os.time() - LL_audio_lastUpdate) > 10 then
        LL_audio_lastValue = LL_audio_currValue
        LL_audio_retry_interval = 10
        LL_audio_lastUpdate = os.time()
        local systemResult = vim.fn.system({'spt', 'pb', '-s', '-f', '%t - %a'}) -- Needs to be run async
        LL_audio_currValue = '🎵 '..string.sub(systemResult, 1, -2) -- Terminal call appends two characters which break lualine

        if string.find(LL_audio_currValue, "no context") then
          -- No music is running.  Back off system calls for 1 minute
          LL_audio_retry_interval = 60
          LL_audio_currValue = '🔇 No Music'
        end

        if(LL_audio_lastValue ~= LL_audio_currValue) then
          vim.notify(LL_audio_currValue, 'info')
        end
      end

      return LL_audio_currValue
    end

    local function curr_time()
      return os.date('%Y-%m-%d %H:%M:%S')
    end

    luaMod.module.setup {
      options = {
        icons_enabled = true,
        theme = 'powerline',
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
        lualine_x = { audio_status, 'encoding' },
        lualine_y = {'location'},
        lualine_z = { curr_time }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {}
    }

  end
end

return M
