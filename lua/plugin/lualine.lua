local modLoader = require('utils.moduleLoader')
local spotifyHelper = require('utils.spotify')

LL_audio_lastUpdate = 0
LL_audio_retry_interval = 10000
LL_audio_currValue = nil

local M = {}

M.config = function()

  local luaMod = modLoader.loadModule('lualine')

  if luaMod.loaded then

    local function update_audio_status()
      LL_audio_lastUpdate = os.time()

      local track_info = spotifyHelper.get_track_info()

      if track_info.is_playing then
        LL_audio_retry_interval = 10000
      else
        LL_audio_retry_interval = 60000
      end

      if(track_info.track_display ~= LL_audio_currValue) then
        LL_audio_currValue = track_info.track_display
        vim.notify(LL_audio_currValue, 'info')
      end

      vim.defer_fn(function() update_audio_status() end, LL_audio_retry_interval)
    end

    local function audio_status()
      if LL_audio_lastUpdate == 0 then
        update_audio_status()
      end

      return LL_audio_currValue
    end

    local function curr_time()
      return os.date('%Y-%m-%d %H:%M:%S')
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
