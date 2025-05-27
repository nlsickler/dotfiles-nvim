local modLoader = require('utils.moduleLoader')

local wkLoader = modLoader.loadModule('which-key')

if wkLoader.loaded then
  local wkMod = wkLoader.module

  vim.g.mapleader = ' '
  vim.g.maplocalleader = ','

  if nil ~= wkMod then

    wkMod.add({

      -------------------------------------------------------
      --- QUALITY OF LIFE COMMANDS
      -------------------------------------------------------

      {";", ":", desc = "Command Key", mode = "n"},
      {"<ESC>", "<C-\\><C-N>", desc = "Exit Terminal Mode", mode = "t"},
      {"<leader>xx", "<cmd>set filetype=<cr>", desc = "Disable Highlight", mode = "n"},
      {"<leader>k", "<cmd>nohl<cr>", desc = "Disable Search Highlight", mode = "n"},

      -------------------------------------------------------
      --- SPLIT COMMANDS
      -------------------------------------------------------

      {"<C-H>", "<C-W><C-H>", desc = "Switch Split Left", mode = "n"},
      {"<C-J>", "<C-W><C-J>", desc = "Switch Split Down", mode = "n"},
      {"<C-K>", "<C-W><C-K>", desc = "Switch Split Up", mode = "n"},
      {"<C-L>", "<C-W><C-L>", desc = "Switch Split Right", mode = "n"},
      {"<C-Right>", "<cmd>vertical resize +3<cr>", desc = "Increase Vert Split Size", mode = "n"},
      {"<C-Left>", "<cmd>vertical resize -3<cr>", desc = "Decrease Vert Split Size", mode = "n"},
      {"<C-Up>", "<cmd>resize -3<cr>", desc = "Decrease Horiz Split Size", mode = "n"},
      {"<C-Down>", "<cmd>resize +3<cr>", desc = "Increase Horiz Split Size", mode = "n"},

      -------------------------------------------------------
      --- WINDOW MANAGEMENT COMMANDS
      -------------------------------------------------------

      {"<leader>w", group = "Window Commands"},
      {"<leader>wm", "<cmd>WindowsMaximize<cr>", desc = "Maximize Window", mode = "n"},
      {"<leader>we", "<cmd>WindowsEqualize<cr>", desc = "Maximize Window", mode = "n"},

      -------------------------------------------------------
      --- BUFFER COMMANDS
      -------------------------------------------------------

      {"<leader>b", group = "Buffer Commands"},
      {"<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort open buffers", mode = "n"},
      {"<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Jump to Buffer", mode = "n"},
      {"<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Jump to Buffer", mode = "n"},

      -------------------------------------------------------
      --- LSP COMMANDS
      -------------------------------------------------------

      -- "Go" Commands
      {"g", group = "Goto Commands"},
      {"gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto Definition", mode = "n"},
      {"gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Goto Definition", mode = "n"},
      {"gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto Definition", mode = "n"},
      {"gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Goto Definition", mode = "n"},
      {"gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Goto Definition", mode = "n"},

      -- Actions
      {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Actions", mode = "n"},
      {"<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", mode = "n"},

      -------------------------------------------------------
      --- SNACK COMMANDS
      -------------------------------------------------------

      {"<C-N>", function() require("snacks").explorer() end, desc = "Open File Tree", mode = "n"},
      {"<leader>\\", function() require("snacks").terminal() end, desc = "Toggle Terminal", mode = "n"},
      {"<leader>bd", function() require("snacks").bufdelete.delete() end, desc = "Close current buffer", mode = "n"},
      {"<leader>bD", function() require("snacks").bufdelete.other() end, desc = "Close other buffers", mode = "n"},
      {"<leader>u", function() require("snacks").picker.undo() end, desc = "Show Undo Tree", mode = "n"},

      {"<leader>s", group = "Snack"},
      {"<leader>sl", function() require("snacks").lazygit() end, desc = "LazyGit"},
      {"<leader>sS", function() require("snacks").scratch() end, desc = "Scratch buffer", mode = "n"},
      {"]w", function() require("snacks").words.jump(1, true) end, desc = "Jump to Next Word"},
      {"[w", function() require("snacks").words.jump(-1, true) end, desc = "Jump to Next Word"},

      -- Pickers
      {"<leader>bm", function() require("snacks").picker.buffers() end, desc = "Buffers", mode = "n"},
      {"<leader>sb", function() require("snacks").picker.buffers() end, desc = "Buffers", mode = "n"},
      {"<leader>sf", function() require("snacks").picker.smart() end, desc = "Smart Files", mode = "n"},
      {"<leader>ss", function() require("snacks").picker.grep() end, desc = "Search in Files", mode = "n"},
      {"<leader>sh", function() require("snacks").picker.help() end, desc = "Help", mode = "n"},
      {"<leader>sk", function() require("snacks").picker.keymaps() end, desc = "Keymaps", mode = "n"},
      {"<leader>sn", function() require("snacks").picker.notifications() end, desc = "Buffers", mode = "n"},
      {"<leader>sp", function() require("snacks").picker.projects() end, desc = "Projects", mode = "n"},
      {"<leader>sP", function() require("snacks").picker.spelling() end, desc = "Spelling", mode = "n"},

      {"<leader>sg", group = "Snack: Git Commands"},
      {"<leader>sgb", function() require("snacks").picker.git_branches() end, desc = "Git Branches"},
      {"<leader>sgs", function() require("snacks").picker.git_status() end, desc = "Git Status"},
      {"<leader>sgS", function() require("snacks").picker.git_status() end, desc = "Git Stash"},
      {"<leader>sgl", function() require("snacks").picker.git_log() end, desc = "Git Log"},

    })
  end

end
