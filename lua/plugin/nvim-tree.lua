local modLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local treeMod = modLoader.loadModule('nvim-tree')

  if treeMod.loaded then

    vim.cmd [[let g:nvim_tree_respect_buf_cwd = 0]]
    vim.cmd [[let g:nvim_tree_disable_window_picker = 0]]

    treeMod.module.setup({
      disable_netrw        = false,
      hijack_netrw         = true,
      open_on_setup        = false,
      ignore_ft_on_setup   = {},
      auto_close           = false,
      auto_reload_on_write = true,
      open_on_tab          = false,
      hijack_cursor        = false,
      update_cwd           = false,
      hijack_unnamed_buffer_when_opening = false,
      hijack_directories   = {
        enable = true,
        auto_open = true,
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      update_focused_file = {
        enable      = true,
        update_cwd  = false,
        ignore_list = {'startify'}
      },
      system_open = {
        cmd  = nil,
        args = {}
      },
      filters = {
        dotfiles = false,
        custom = {}
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true,
        mappings = {
          custom_only = false,
          list = {}
        },
        number = true,
        relativenumber = false,
        signcolumn = "yes"
      },
      trash = {
        cmd = "trash",
        require_confirm = true
      },
      actions = {
        change_dir = {
          global = false,
        },
        open_file = {
          quit_on_open = false,
        }
      }
    })
  end
end

return M
