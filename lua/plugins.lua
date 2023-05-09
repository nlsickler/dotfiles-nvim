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
    "folke/lazy.nvim",
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim"
  }

  local generalFunctionTweaks = {
    "sitiom/nvim-numbertoggle",
    "tpope/vim-sensible",
    { "folke/which-key.nvim", init = function() require('plugin.whichkey').config() end, lazy = false },
    "psliwka/vim-smoothie",
    "jghauser/mkdir.nvim",
    { 'zakharykaplan/nvim-retrail', init = function() require('plugin.retrail').config() end, event = "VeryLazy" },
  }

  local graphicalEnhance = {
    { 'rcarriga/nvim-notify', init = function() require('plugin.notify').config() end },
    { 'chentoast/marks.nvim', init = function() require('marks').setup() end }, -- Add marks to the sign column
    { 'akinsho/bufferline.nvim', init = function() require('plugin.bufferline').config() end, dependencies = 'nvim-notify', requires = 'kyazdani42/nvim-web-devicons', lazy = false },
    { 'kevinhwang91/nvim-bqf', init = function() require('plugin.bqf').config() end, dependencies = {'nvim-notify', 'nvim-treesitter' } }, -- Enhances the quickfix menu with previews, treesitter, and more
    { 'akinsho/toggleterm.nvim', init = function() require('plugin.toggleterm').config() end, dependencies = 'nvim-notify' },
    'ryanoasis/vim-devicons', -- Adds git icons to NERDTree, lightline, vim-startify, etc
    { "kylechui/nvim-surround", init = function() require("nvim-surround").setup() end }, -- Vim-Surround, but rewritten for neovim (supporting TreeSitter)
    { 'folke/twilight.nvim', init = function() require('plugin.twilight').config() end, dependencies = {'nvim-notify', 'nvim-treesitter' } }, -- Allows disabling color coding outside of current scope (using treesitter)
    { 'nvim-lualine/lualine.nvim', init = function() require('plugin.lualine').config() end }, -- Powerline/Airline alterative for bottom status bar
    { "anuvyklack/windows.nvim", requires = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" }, init = function() require('plugin.windows').config() end }, -- Automically resizes windows
  }

  local newFunctionality = {
    { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim'}, lazy = false }, -- Fuzzy completion
    { 'mhinz/vim-startify', init = function() require('plugin.startify').config() end, dependencies = 'nvim-notify', lazy = false }, -- Dashboard style plugin for the start screen
    { 'nvim-neo-tree/neo-tree.nvim', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' }, init = function() require('plugin.neotree').config() end, lazy = false }, -- File explorer
    { 'matbme/JABS.nvim', init = function() require('jabs').setup() end, event = "VeryLazy" }, -- Just Another Buffer Switcher - shows buffers in a pop-up allowing them to be swtiched, deleted, etc.

    -- {'mbbill/undotree', cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" } },
  }

  local gitExtensions = {
    {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end, event = "VeryLazy", },
    {'tpope/vim-fugitive', event = "VeryLazy", }
  }

  local programmingFunctions = {
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', dependencies = 'nvim-notify', event = "VeryLazy", }, -- Core configuration moved to textobjects since they are configured together
    { 'nvim-treesitter/nvim-treesitter-textobjects', init = function() require('plugin.treesitter.core').config() end, dependencies = 'nvim-treesitter', event = "VeryLazy",},
    { 'nvim-treesitter/nvim-treesitter-context', init = function() require('treesitter-context').setup() end, dependencies = 'nvim-treesitter', event = "VeryLazy", },

    { "williamboman/mason.nvim", build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim", dependencies = "mason.nvim", event = "VeryLazy",  },
    { "neovim/nvim-lspconfig", init = function() require("plugin.mason").config() end, dependencies = "mason-lspconfig.nvim", event = "VeryLazy",  },

    { 'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter', event = "VeryLazy", }, -- Different colored closing brackets, etc.
    { 'windwp/nvim-autopairs', init = function() require('plugin.autopairs').config() end, dependencies = 'nvim-notify', event = "VeryLazy", }, -- Automically close parens, quotes in insert
    { 'numToStr/Comment.nvim', init = function() require('plugin.comment').config() end, dependencies = 'nvim-notify', event = "VeryLazy", },
    { 'folke/trouble.nvim', init = function() require('plugin.trouble').config() end, dependencies = 'nvim-notify', event = "VeryLazy", },
    { 'gpanders/editorconfig.nvim', event = "VeryLazy" }, -- Makes nvim respect .editorconfig files

    -- { 'norcalli/nvim-colorizer.lua', init = function() require('plugin.colorizer').config() end, dependencies = 'nvim-notify', event = "VeryLazy", }, -- Changes background color of color codes
    -- { 'mfussenegger/nvim-dap', init = function() require('plugin.dap').config() end, dependencies = 'nvim-notify', event = "VeryLazy", },
    -- { 'simrat39/symbols-outline.nvim', init = function() require('plugin.symbols-outline').config() end, dependencies = 'nvim-notify', event = "VeryLazy", },
  }

  local codeCompletion = {
    { 'hrsh7th/cmp-nvim-lsp', event = "VeryLazy" },
    { 'hrsh7th/cmp-buffer', event = "VeryLazy" },
    { 'hrsh7th/cmp-path', event = "VeryLazy" },
    { 'hrsh7th/cmp-cmdline', event = "VeryLazy" },
    { 'hrsh7th/nvim-cmp', init = function() require('plugin.nvim-cmp').config() end, dependencies = 'nvim-notify', event = "VeryLazy" },

    { 'ray-x/lsp_signature.nvim', init = function() require('plugin.lsp-signature').config() end, dependencies = 'nvim-cmp', event = "VeryLazy" },

    { 'hrsh7th/cmp-nvim-lsp-signature-help', event = "VeryLazy" },

    -- Snippets
    { 'hrsh7th/cmp-vsnip', event = "VeryLazy" },
    { 'hrsh7th/vim-vsnip', event = "VeryLazy" }
  }


  local colorSchemes = {

    'nlsickler/colorscheme-tweaks.nvim', -- Adds IncreaseContrast and DecreaseContrast commands

    --Color Schemes
    { 'folke/tokyonight.nvim', init = function() require('plugin.cs-tokyonight').config() end, dependencies = 'colorscheme-tweaks.nvim'},
    { 'rafamadriz/neon', init = function() require('plugin.cs-neon').config() end },
    { 'marko-cerovac/material.nvim', init = function() require('plugin.cs-material').config() end },
    { 'Th3Whit3Wolf/one-nvim', init = function() require('plugin.cs-onenvim').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'Th3Whit3Wolf/space-nvim', init = function() require('plugin.cs-spacenvim').config() end },
    { 'ray-x/aurora', init = function() require('plugin.cs-aurora').config() end },
    { 'tanvirtin/monokai.nvim', init = function() require('plugin.cs-monokai').config() end },
    { 'B4mbus/oxocarbon-lua.nvim', init = function() require('plugin.cs-oxocarbon').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'catppuccin/nvim', init = function() require('plugin.cs-catppuccin').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'rebelot/kanagawa.nvim', init = function() require('plugin.cs-kanagawa').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    { 'projekt0n/github-nvim-theme', init = function() require('plugin.cs-github').config() end, dependencies = 'colorscheme-tweaks.nvim'},
    { 'lukas-reineke/indent-blankline.nvim', init = function() require('plugin.indent-blankline').config() end },
    { 'EdenEast/nightfox.nvim', init = function() require('plugin.cs-nightfox').config() end, dependencies = 'colorscheme-tweaks.nvim' },
    'Yazeed1s/oh-lucy.nvim',
    'Tsuzat/NeoSolarized.nvim',
    'savq/melange-nvim',
  }

  local testPlugins = {
    { 'echasnovski/mini.nvim', init = function() require('plugin.mini').config() end, after = 'nvim-notify' }
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
