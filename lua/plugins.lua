local M = {}

M.LazyOpts = {}

M.loadPlugins = function()
  return M.loadPluginsLazy()
end

M.bootstrapLazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

M.buildPluginTable = function()
  local dependencyTable = {
    "folke/lazy.nvim", -- Package manager
    "nvim-lua/plenary.nvim", -- UI Framework
    "kyazdani42/nvim-web-devicons", -- Tech icons
    "MunifTanjim/nui.nvim", -- UI Framework
    "anuvyklack/middleclass", -- Window Management Depend
    "anuvyklack/animation.nvim" -- Window Management Depend
  }

  local generalFunctionTweaks = {
    "sitiom/nvim-numbertoggle", -- Automatically toggles relative and absoute numbers
    --"tpope/vim-sensible",
    { "folke/which-key.nvim", init = function() require('plugin.whichkey').config() end, lazy = false }, -- Hotkey guide
    "psliwka/vim-smoothie", -- Smooth Scrolling
    "jghauser/mkdir.nvim", -- Makes missing folders on file save
    { 'zakharykaplan/nvim-retrail', init = function() require('plugin.retrail').config() end, event = "VeryLazy" }, -- Removes trailing spaces
    { 'lukas-reineke/indent-blankline.nvim', init = function() require('plugin.indent-blankline').config() end }, --Indent lines on lhs
  }

  local graphicalEnhance = {
    { 'rcarriga/nvim-notify', init = function() require('plugin.notify').config() end }, -- Notification framework
    { 'chentoast/marks.nvim', init = function() require('marks').setup() end }, -- Add marks to the sign column
    { 'akinsho/bufferline.nvim', init = function() require('plugin.bufferline').config() end, dependencies = 'nvim-notify', requires = 'kyazdani42/nvim-web-devicons', lazy = false }, -- Bufferline
    { 'kevinhwang91/nvim-bqf', init = function() require('plugin.bqf').config() end, dependencies = {'nvim-notify', 'nvim-treesitter' } }, -- Enhances the quickfix menu with previews, treesitter, and more
    { 'akinsho/toggleterm.nvim', init = function() require('plugin.toggleterm').config() end, dependencies = 'nvim-notify' }, -- Toggleable terminal
    'ryanoasis/vim-devicons', -- Adds git icons to NERDTree, lightline, vim-startify, etc
    { "kylechui/nvim-surround", init = function() require("nvim-surround").setup() end }, -- Vim-Surround, but rewritten for neovim (supporting TreeSitter)
    --{ 'folke/twilight.nvim', init = function() require('plugin.twilight').config() end, dependencies = {'nvim-notify', 'nvim-treesitter' } }, -- Allows disabling color coding outside of current scope (using treesitter)
    { 'nvim-lualine/lualine.nvim', init = function() require('plugin.lualine').config() end }, -- Powerline/Airline alterative for bottom status bar
    { "anuvyklack/windows.nvim", requires = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" }, init = function() require('plugin.windows').config() end }, -- Automatically resizes windows
  }

  local newFunctionality = {
    { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim'}, lazy = false }, -- Fuzzy completion
    { 'mhinz/vim-startify', init = function() require('plugin.startify').config() end, dependencies = 'nvim-notify', lazy = false }, -- Dashboard style plugin for the start screen
    { 'nvim-neo-tree/neo-tree.nvim', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' }, init = function() require('plugin.neotree').config() end, lazy = false }, -- File explorer
    { 'matbme/JABS.nvim', init = function() require('jabs').setup() end, event = "VeryLazy" }, -- Just Another Buffer Switcher - shows buffers in a pop-up allowing them to be switched, deleted, etc.
    { "nvim-neorg/neorg", build = ":Neorg sync-parsers", dependencies = "nvim-lua/plenary.nvim", config = function() require('plugin.neorg').config() end }, -- Notes

    {'mbbill/undotree', cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" } }, -- Undo visualization (Requires a vim install)
  }

  local gitExtensions = {
    {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end, event = "VeryLazy", },  -- Git change signs in the gutter
    {'tpope/vim-fugitive', event = "VeryLazy", } -- Git accessors via command
  }

  local programmingFunctions = {
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', dependencies = 'nvim-notify', event = "VeryLazy", }, -- Core configuration moved to textobjects since they are configured together
    { 'nvim-treesitter/nvim-treesitter-textobjects', init = function() require('plugin.treesitter.core').config() end, dependencies = 'nvim-treesitter', event = "VeryLazy",},
    { 'nvim-treesitter/nvim-treesitter-context', init = function() require('treesitter-context').setup() end, dependencies = 'nvim-treesitter', event = "VeryLazy", },

    { "williamboman/mason.nvim", build = ":MasonUpdate" }, -- LSP Management
    { "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim", event = "VeryLazy",  }, -- Mason + LSP Config integration
    { "neovim/nvim-lspconfig", init = function() require("plugin.mason").config() end, dependencies = "mason-lspconfig.nvim", event = "VeryLazy",  }, -- LSP Configs

    { 'folke/trouble.nvim', init = function() require('plugin.trouble').config() end, dependencies = 'nvim-notify', event = "VeryLazy", }, -- Shows errors
    { 'gpanders/editorconfig.nvim', event = "VeryLazy" }, -- Makes nvim respect .editorconfig files

    -- { 'mfussenegger/nvim-dap', init = function() require('plugin.dap').config() end, dependencies = 'nvim-notify', event = "VeryLazy", },
    { 'simrat39/symbols-outline.nvim', init = function() require('plugin.symbols-outline').config() end, dependencies = 'nvim-notify', event = "VeryLazy", }, -- Symbol outline of file
  }

  local codeCompletion = {
    { 'hrsh7th/cmp-nvim-lsp', event = "VeryLazy" },
    { 'hrsh7th/cmp-buffer', event = "VeryLazy" },
    { 'hrsh7th/cmp-path', event = "VeryLazy" },
    { 'hrsh7th/cmp-cmdline', event = "VeryLazy" },
    { 'hrsh7th/nvim-cmp', init = function() require('plugin.nvim-cmp').config() end, dependencies = 'nvim-notify', event = "VeryLazy" },

    { 'ray-x/lsp_signature.nvim', init = function() require('plugin.lsp-signature').config() end, dependencies = 'nvim-cmp', event = "VeryLazy" }, -- Pop up method signatures

    { 'hrsh7th/cmp-nvim-lsp-signature-help', event = "VeryLazy" },

    -- Snippets
    { 'hrsh7th/cmp-vsnip', event = "VeryLazy" },
    { 'hrsh7th/vim-vsnip', event = "VeryLazy" }
  }


  local colorSchemes = {

    'nlsickler/colorscheme-tweaks.nvim', -- Adds IncreaseContrast and DecreaseContrast commands

    --Color Schemes
    { 'folke/tokyonight.nvim', init = function() require('plugin.cs-tokyonight').config() end, dependencies = 'colorscheme-tweaks.nvim'},
    { 'B4mbus/oxocarbon-lua.nvim', init = function() require('plugin.cs-oxocarbon').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'catppuccin/nvim', init = function() require('plugin.cs-catppuccin').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'rebelot/kanagawa.nvim', init = function() require('plugin.cs-kanagawa').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'EdenEast/nightfox.nvim', init = function() require('plugin.cs-nightfox').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'bluz71/vim-nightfly-colors', init = function() require('plugin.cs-nightfly').config() end, dependencies = 'colorscheme-tweaks.nvim' },
  }

  local testPlugins = {
    { 'echasnovski/mini.nvim', init = function() require('plugin.mini').config() end, after = 'nvim-notify' },
    { 'Maxlufs/LargeFile.vim', init = function() require('plugin.largefile').config() end, after = 'nvim-notify'},
  }

  table.move(generalFunctionTweaks, 1, #generalFunctionTweaks, #dependencyTable+1, dependencyTable)
  table.move(graphicalEnhance, 1, #graphicalEnhance, #dependencyTable+1, dependencyTable)
  table.move(newFunctionality, 1, #newFunctionality, #dependencyTable+1, dependencyTable)
  table.move(gitExtensions, 1, #gitExtensions, #dependencyTable+1, dependencyTable)
  table.move(programmingFunctions, 1, #programmingFunctions, #dependencyTable+1, dependencyTable)
  table.move(codeCompletion, 1, #codeCompletion, #dependencyTable+1, dependencyTable)
  table.move(colorSchemes, 1, #colorSchemes, #dependencyTable+1, dependencyTable)
  table.move(testPlugins, 1, #testPlugins, #dependencyTable+1, dependencyTable)

  return dependencyTable

  end

  M.loadPluginsLazy = function()
    M.bootstrapLazy()

    require("lazy").setup(M.buildPluginTable(), M.LazyOpts)
  end

return M
