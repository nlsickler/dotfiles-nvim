local modLoader = require('utils.moduleLoader')

local wkLoader = modLoader.loadModule('which-key')

if wkLoader.loaded then
  local wkMod = wkLoader.module

  vim.g.mapleader = ' '
  vim.g.maplocalleader = ','

  --vim.keymap.set("nv", ';', ':')

  if nil ~= wkMod then

    --[[wkMod.register({
      ["<leader>"] = {'<nop>', 'NOOP'},
      ["<localleader>"] = {'<nop>', 'NOOP'},
    })]]--

    wkMod.register({
      [";"] = { ":", {mode = "nv" }, "Remap ; to start a command" },
      ["ghp"] = {'<Plug>(GitGutterPreviewHunk)', "GitGutter - Preview Diff Under Cursor"},
      ["<C-N>"] = {'<cmd>Neotree toggle<CR>', 'NeoTree - Toggle'},

      ["<C-H>"] = {'<C-W><C-H>', 'Switch split left'},
      ["<C-J>"] = {'<C-W><C-J>', 'Switch split Down'},
      ["<C-K>"] = {'<C-W><C-K>', 'Switch split Up'},
      ["<C-L>"] = {'<C-W><C-L>', 'Switch split Right'},

      ["<C-Left>"] = {'<cmd>vertical resize +3<CR>', 'Resize vertical split 3 columns'},
      ["<C-Right>"] = {'<cmd>vertical resize -3<CR>', 'Resize vertical split 3 columns'},
      ["<C-Up>"] = {'<cmd>resize +3<CR>', 'Resize split 3 columns'},
      ["<C-Down>"] = {'<cmd>resize -3<CR>', 'Resize split 3 columns'},

      ['<S-h>'] = {'<cmd>BufferLineCyclePrev<CR>', 'BufferLine - Previous Tab'},
      ['<S-l>'] = {'<cmd>BufferLineCycleNext<CR>', 'BufferLine - Next Tab'},

      ["<leader>BD"] = {':Bdelete!<CR>', 'bbye - Force close buffer'},
      ["<leader>xx"] = {'<cmd>set filetype=<cr>', 'Disable highlight'},

      K = {':lua vim.lsp.buf.hover()<cr>', 'LSP - Hover Info'},
      g = {
        name = 'Go Commands',
        d = {':lua vim.lsp.buf.definition()<cr>', 'LSP - Definition'},
        D = {':lua vim.lsp.buf.declaration()<cr>', 'LSP - Declaration'},
        i = {':lua vim.lsp.buf.implementation()<cr>', 'LSP - Implementation'},
        r = {':lua vim.lsp.buf.references()<cr>', 'LSP - References'},
        t = {':lua vim.lsp.buf.type_definition()<cr>', 'LSP - Type Def'},
      },

      ["<leader>"] = {
        name = "Plugin Commands",
        k = {'<cmd>nohl<cr>', 'Hide highlights'},
        ["wm"] = {'<cmd>WindowsMaximize<cr>', 'Windows - Maximize Window'},
        ["we"] = {'<cmd>WindowsEqualize<cr>', 'Windows - Equalize Windows'},
        ["wt"] = {'<cmd>WindowsToggleAutowidth<cr>', 'Windows - Equalize Windows'},
        ['u']  = {'<cmd>UndotreeToggle<cr>', 'Undotree - Toggle'},
        ['\\'] = {'<cmd>ToggleTerm<cr>', 'ToggleTerm - Toggle'},
        n = {
          name = "Global Neorg Commands",
          c = {'<cmd>Neorg toggle-concealer<cr>', 'Neorg - Toggle Concealer' },
          i = {'<cmd>Neorg index<cr>', 'Neorg - Index'},
          n = {'<cmd>Neorg journal today<cr>', 'Neorg - Journal - Today'},
          t = {'<cmd>Neorg journal tomorrow<cr>', 'Neorg - Journal - Tomorrow'},
          y = {'<cmd>Neorg journal yesterday<cr>', 'Neorg - Journal - Yesterday'},
          q = {'<cmd>Neorg toc qflist<cr>', 'Neorg - Table of Contents QuickFix'},
          x = {'<cmd>Neorg return<cr>', 'Neorg - Return (close)'},
          e = {'<cmd>Neorg export to-file ~/neorg-temp.md<cr>', 'Neorg - Markdown export to ~/neorg-temp.md'},
        },
        t = {
          name = "Telescope Commands",
          f = {'<cmd>lua require(\'telescope.builtin\').find_files()<cr>', 'Telescope - Files'},
          s = {'<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', 'Telescope - Grep'},
          h = {'<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', 'Telescope - Help'},
          b = {'<cmd>lua require(\'telescope.builtin\').builtin()<cr>', 'Telescope - Builtins'},
          j = {'<cmd>lua require(\'telescope.builtin\').jumplist()<cr>', 'Telescope - Jumplist'},
          n = {'<cmd>lua require(\'telescope\').extensions.notify.notify()<cr>', 'Telescope - Notify'},
          t = {"<cmd>TroubleToggle<cr>", 'Trouble - Toggle'},
          -- w = {"<cmd>Twilight<cr>", "Twilight - Toggle"},
          l = {
            name = 'LSP Commands',
            y = {'<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', 'Telescope - LSP Document Symbols'},
            Y = {'<cmd>lua require(\'telescope.builtin\').lsp_workspace_symbols()<cr>', 'Telescope - LSP Workspace Symbols'},
            i = {'<cmd>lua require(\'telescope.builtin\').lsp_implementations()<cr>', 'Telescope - LSP Implementations'},
            d = {'<cmd>lua require(\'telescope.builtin\').lsp_definitions()<cr>', 'Telescope - LSP Definitions'},
            t = {'<cmd>lua require(\'telescope.builtin\').lsp_type_definitions()<cr>', 'Telescope - LSP Type Definitions'},
            ["?"] = {'<cmd>lua require(\'telescope.builtin\').diagnostics()<cr>', 'Telescope - LSP Workspace Diagnostics'},
          },
          g = {
            name = "Telescope - Git",
            c = {'<cmd>lua require(\'telescope.builtin\').git_commits()<cr>', 'Telescope - Git Commits'},
            b = {'<cmd>lua require(\'telescope.builtin\').git_branches()<cr>', 'Telescope - Git Branches'},
            s = {'<cmd>lua require(\'telescope.builtin\').git_status()<cr>', 'Telescope - Git Status'},
          }
        }, --Telescope Commands
        l = {
          name = "LSP - Commands",
          a = {':lua vim.lsp.buf.code_action()<cr>', 'LSP - Code Actions'},
          r = {':lua vim.lsp.buf.rename()<cr>', 'LSP - Rename'}
        }, -- LSP Commands
        b = {
          name = 'Buffer Commands',
          d = {'<cmd>lua MiniBufremove.delete(0, true)<CR>', 'Mini - Close Buffer'},
          s = {'<cmd>BufferLineSortByDirectory<CR>', 'BufferLine - Sort Buffers'},
          m = {'<cmd>JABSOpen<CR>', 'JABS - Manage buffers'},
          ['1'] = {'<Cmd>BufferLineGoToBuffer 1<CR>', 'BufferLine - Jump to Buffer 1'},
          ['2'] = {'<Cmd>BufferLineGoToBuffer 2<CR>', 'BufferLine - Jump to Buffer 2'},
          ['3'] = {'<Cmd>BufferLineGoToBuffer 3<CR>', 'BufferLine - Jump to Buffer 3'},
          ['4'] = {'<Cmd>BufferLineGoToBuffer 4<CR>', 'BufferLine - Jump to Buffer 4'},
          ['5'] = {'<Cmd>BufferLineGoToBuffer 5<CR>', 'BufferLine - Jump to Buffer 5'},
          ['6'] = {'<Cmd>BufferLineGoToBuffer 6<CR>', 'BufferLine - Jump to Buffer 6'},
          ['7'] = {'<Cmd>BufferLineGoToBuffer 7<CR>', 'BufferLine - Jump to Buffer 7'},
          ['8'] = {'<Cmd>BufferLineGoToBuffer 8<CR>', 'BufferLine - Jump to Buffer 8'},
          ['9'] = {'<Cmd>BufferLineGoToBuffer 9<CR>', 'BufferLine - Jump to Buffer 9'},
        },

      }
    })

  end

end

-- Separate from Which-Key because of a bug with escaping the '\' in the command
-- https://github.com/folke/which-key.nvim/issues/249
vim.api.nvim_set_keymap('t','<ESC>', '<C-\\><C-N>', {noremap = true})

