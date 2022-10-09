local M = {}

M.get_track_info = function()
  local systemResult = vim.fn.system({'spt', 'pb', '-s', '-f', '%t - %a'}) -- Needs to be run async
  local result = '🎵 '..string.sub(systemResult, 1, -2) -- Terminal call appends two characters which break lualine
  local is_playing = true

  if string.find(result, "no context") then
      result = '🔇 No Music'
      is_playing = false
  end

  return {
    track_display = result,
    is_playing = is_playing
  }
end

M.get_media_info = function()
  local systemResult = vim.fn.system([[Get-Current-Media.ps1]])

  local result = '🎵 '..string.sub(systemResult, 1, -2) -- Terminal call appends two characters which break lualine
  local is_playing = true

  if not string.find(result, '-') then
    result = '🔇 No Media'
    is_playing = false
  end

  -- print(result)

  return {
    track_display = result,
    is_playing = is_playing
  }
end

return M
