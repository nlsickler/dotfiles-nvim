local modLoader = require('utils.moduleLoader')

local wkMod = modLoader.loadModule('which-key')

if wkMod.loaded then
  local wk = wkMod.module

  vim.g.mapleader = ' '

  if nil ~= wk then
    wk.register({
      ["<leader>"] = {'<nop>', 'NOOP'},
    })

    wk.register({

      [";"] = { ":", {mode = "nv" } },
      ["ghp"] = {'<Plug>(GitGutterPreviewHunk)', "Preview Git Diff Under Cursor"},

      ["<C-N>"] = {'<cmd>NeoTreeShowToggle<CR>', 'Toggle NERDTree'},
      -- ["<C-N>"] = {'<cmd>CHADopen<CR>', 'Toggle CHADtree'},
      -- ["<C-N>"] = {'<cmd>NvimTreeToggle<CR>', 'Toggle CHADtree'},

      ["<C-H>"] = {'<C-W><C-H>', 'Switch split left'},
      ["<C-J>"] = {'<C-W><C-J>', 'Switch split Down'},
      ["<C-K>"] = {'<C-W><C-K>', 'Switch split Up'},
      ["<C-L>"] = {'<C-W><C-L>', 'Switch split Right'},

      ["<C-Left>"] = {'<cmd>vertical resize +3<CR>', 'Resize vertical split 3 columns'},
      ["<C-Right>"] = {'<cmd>vertical resize -3<CR>', 'Resize vertical split 3 columns'},
      ["<C-Up>"] = {'<cmd>resize +3<CR>', 'Resize split 3 columns'},
      ["<C-Down>"] = {'<cmd>resize -3<CR>', 'Resize split 3 columns'},

      -- ['<S-h>'] = {'<cmd>BufferLineCyclePrev<CR>', 'Previous Bufferline Tab'},
      -- ['<S-l>'] = {'<cmd>BufferLineCycleNext<CR>', 'Previous Bufferline Tab'},
      ['<S-h>'] = {'<Plug>(cokeline-focus-prev)', 'Previous Bufferline Tab'},
      ['<S-l>'] = {'<Plug>(cokeline-focus-next)', 'Previous Bufferline Tab'},

      ["BD"] = {':bd!<CR>', 'Force close buffer'},

      K = {':lua vim.lsp.buf.hover()<cr>', 'LSP Hover Info'},
      g = {
        name = 'Go Commands',
        d = {':lua vim.lsp.buf.definition()<cr>', 'LSP Definition'},
        D = {':lua vim.lsp.buf.declaration()<cr>', 'LSP Declaration'},
        i = {':lua vim.lsp.buf.implementation()<cr>', 'LSP Implementation'},
        r = {':lua vim.lsp.buf.references()<cr>', 'LSP References'},
        t = {':lua vim.lsp.buf.type_definition()<cr>', 'LSP Type Def'},
        s = {'<cmd>NeoTreeFloat git_status<CR>', 'Git status is floating window'} -- Disabling because it always shows an empty git status
      },

      ["<leader>"] = {
        name = "Plugin Commands",
        k = {'nohl', 'Hide highlights'},
        n = {'<cmd>lua require(\'telescope\').extensions.notify.notify()<cr>', 'Telescope Files'},
        ["ss"] = {'<cmd>Telescope aerial<CR>', 'Symbols Search'},
        ["sy"] = {'<cmd>AerialToggle!<CR>', 'Symbols Outline'},
        t = {
          name = "Telescope Commands",
          f = {'<cmd>lua require(\'telescope.builtin\').find_files()<cr>', 'Telescope Files'},
          s = {'<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', 'Telescope Grep'},
          h = {'<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', 'Telescope Help'},
          b = {'<cmd>lua require(\'telescope.builtin\').builtin()<cr>', 'Telescope Builtins'},
          t = {"<cmd>TroubleToggle<cr>", 'Trouble toggle'},
          l = {
            name = 'LSP Commands',
            y = {'<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', 'LSP Document Symbols'},
            Y = {'<cmd>lua require(\'telescope.builtin\').lsp_workspace_symbols()<cr>', 'LSP Workspace Symbols'},
            i = {'<cmd>lua require(\'telescope.builtin\').lsp_implementations()<cr>', 'LSP Implementations'},
            d = {'<cmd>lua require(\'telescope.builtin\').lsp_definitions()<cr>', 'LSP Definitions'},
            t = {'<cmd>lua require(\'telescope.builtin\').lsp_type_definitions()<cr>', 'LSP Type Definitions'},
            ["?"] = {'<cmd>lua require(\'telescope.builtin\').diagnostics()<cr>', 'LSP Workspace Diagnostics'},
          },
          g = {
            name = "Telescope Git",
            c = {'<cmd>lua require(\'telescope.builtin\').git_commits()<cr>', 'Git Commits'},
            b = {'<cmd>lua require(\'telescope.builtin\').git_branches()<cr>', 'Git Branches'},
            s = {'<cmd>lua require(\'telescope.builtin\').git_status()<cr>', 'Git Status'},
          }
        }, --Telescope Commands
        l = {
          name = "LSP Commands",
          a = {':lua vim.lsp.buf.code_action()<cr>', 'Code Actions'},
          r = {':lua vim.lsp.buf.rename()<cr>', 'Rename'}
        }, -- LSP Commands
        b = {
          name = 'Buffer Commands',
          d = {':bd<CR>', 'Delete Buffer'},
          s = {':BufferLineSortByDirectory<CR>', 'Sort Buffers'},
          ['1'] = {'<Plug>(cokeline-focus-1)', 'Jump to Buffer 1'},
          ['2'] = {'<Plug>(cokeline-focus-2)', 'Jump to Buffer 2'},
          ['3'] = {'<Plug>(cokeline-focus-3)', 'Jump to Buffer 3'},
          ['4'] = {'<Plug>(cokeline-focus-4)', 'Jump to Buffer 4'},
          ['5'] = {'<Plug>(cokeline-focus-5)', 'Jump to Buffer 5'},
          ['6'] = {'<Plug>(cokeline-focus-6)', 'Jump to Buffer 6'},
          ['7'] = {'<Plug>(cokeline-focus-7)', 'Jump to Buffer 7'},
          ['8'] = {'<Plug>(cokeline-focus-8)', 'Jump to Buffer 8'},
          ['9'] = {'<Plug>(cokeline-focus-9)', 'Jump to Buffer 9'},
          --[[ ['1'] = {'<Cmd>BufferLineGoToBuffer 1<CR>', 'Jump to Buffer 1'},
          ['2'] = {'<Cmd>BufferLineGoToBuffer 2<CR>', 'Jump to Buffer 2'},
          ['3'] = {'<Cmd>BufferLineGoToBuffer 3<CR>', 'Jump to Buffer 3'},
          ['4'] = {'<Cmd>BufferLineGoToBuffer 4<CR>', 'Jump to Buffer 4'},
          ['5'] = {'<Cmd>BufferLineGoToBuffer 5<CR>', 'Jump to Buffer 5'},
          ['6'] = {'<Cmd>BufferLineGoToBuffer 6<CR>', 'Jump to Buffer 6'},
          ['7'] = {'<Cmd>BufferLineGoToBuffer 7<CR>', 'Jump to Buffer 7'},
          ['8'] = {'<Cmd>BufferLineGoToBuffer 8<CR>', 'Jump to Buffer 8'},
          ['9'] = {'<Cmd>BufferLineGoToBuffer 9<CR>', 'Jump to Buffer 9'}, ]]
        },

        d = {
          name = 'Debug Adapter Commands',
          b = {'<cmd>lua require("dap").toggle_breakpoint()<cr>', 'Toggle Breakpoint'},
          c = {'<cmd>lua require("dap").continue()<cr>', 'Continue Execution'},
          o = {'<cmd>lua require("dap").step_over()<cr>', 'Step Over'},
          i = {'<cmd>lua require("dap").step_in()<cr>', 'Step Into'},
          r = {'<cmd>lua require("dap").repl.open()<cr>', 'Open REPL'},

        }
      }
    })
  end

end
-- Separate from Which-Key because of a bug with escaping the '\' in the command
-- https://github.com/folke/which-key.nvim/issues/249
vim.api.nvim_set_keymap('t','<ESC>', '<C-\\><C-N>', {noremap = true})

