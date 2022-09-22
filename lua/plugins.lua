local M = {}

M.loadPlugins = function()

  -- Bootstrap Packer
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  local packer_bootstrap = false;

  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  end

  vim.cmd [[packadd packer.nvim]]

  return require('packer').startup(function()
    -- Allow Packer to update Packer
    use {'wbthomason/packer.nvim'}

    -- Basic plugins
    use {'rcarriga/nvim-notify', config = function() require('plugin.notify').config() end } -- Show notification messages
    use { 'mhinz/vim-startify', config = function() require('plugin.startify').config() end, after = 'nvim-notify' }
    use { 'scrooloose/nerdtree', config = function() require('plugin.nerdtree').config() end } -- File explorer
    use 'antoinemadec/FixCursorHold.nvim' --Workaround for an open issue in NeoVim which may take some time to resolve.  Effects several installed plugins: https://github.com/neovim/neovim/issues/12587
    use { 'nvim-neo-tree/neo-tree.nvim', requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' }, config = function() require('plugin.neotree').config() end } -- File explorer
    use 'ryanoasis/vim-devicons' -- Adds git icons to NERDTree, lightline, vim-startify, etc
    use { 'nvim-lualine/lualine.nvim', config = function() require('plugin.lualine').config() end } -- Powerline/Airline alterative for bottom status bar
    use 'tpope/vim-sensible' -- Some general set calls to configure vim (mostly `set`s)
    use {'junegunn/fzf', run = 'fzf#install()' } -- Fuzzy File Finder
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim'} } -- Fuzzy completion
    use { 'folke/which-key.nvim', config = function() require('plugin.whichkey').config() end } -- Key mapping manager and reminder
    use 'psliwka/vim-smoothie' -- Scrolling enhancements
    -- use 'lewis6991/impatient.nvim' -- Plugin loadtime profiler :LuaCacheProfile to see results

    -- Git
    use 'airblade/vim-gitgutter' -- Adds git information to gutter
    use 'tpope/vim-fugitive'

    -- Programming
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('plugin.treesitter').config() end, after = 'nvim-notify' }
    use 'neovim/nvim-lspconfig' -- Integrates with third party lanugage servers
    use { 'williamboman/nvim-lsp-installer', config = function() require('plugin.nvim-lsp-installer').config() end, after = 'nvim-cmp' } -- Installs LSPs
    use { 'stevearc/aerial.nvim', config = function() require('plugin.aerial').config() end, after = 'nvim-notify' } -- Symbol viewer
    use {'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter'} -- Different colored closing brackets, etc.
    use { 'windwp/nvim-autopairs', config = function() require('plugin.autopairs').config() end, after = 'nvim-notify' } -- Automically close parens, quotes in insert
    use { 'norcalli/nvim-colorizer.lua', config = function() require('plugin.colorizer').config() end, after = 'nvim-notify' } -- Changes background of color codes
    use { 'numToStr/Comment.nvim', config = function() require('plugin.comment').config() end, after = 'nvim-notify' }
    use 'tpope/vim-surround' -- Surround operators with ys => You Should
    use { 'folke/trouble.nvim', config = function() require('plugin.trouble').config() end, after = 'nvim-notify' }
    use { 'mfussenegger/nvim-dap', config = function() require('plugin.dap').config() end, after = 'nvim-notify'}

    --Code Completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use { 'hrsh7th/nvim-cmp', config = function() require('plugin.nvim-cmp').config() end, after = 'nvim-notify' }

    -- Snippets for final step of completion (a snippet engine is required by nvim-cmp)
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'nlsickler/colorscheme-tweaks.nvim'

    -- Color Schemes
    -- use { 'RRethy/nvim-base16' , after = 'nvim-notify' } -- Colorschemes for lualine
    use { 'folke/tokyonight.nvim', config = function() require('plugin.cs-tokyonight').config() end, after = 'colorscheme-tweaks.nvim'}
    use { 'rafamadriz/neon', config = function() require('plugin.cs-neon').config() end }
    use { 'marko-cerovac/material.nvim', config = function() require('plugin.cs-material').config() end }
    use { 'Th3Whit3Wolf/one-nvim', config = function() require('plugin.cs-onenvim').config() end, after = 'colorscheme-tweaks.nvim' }
    use { 'Th3Whit3Wolf/space-nvim', config = function() require('plugin.cs-spacenvim').config() end }
    use { 'ray-x/aurora', config = function() require('plugin.cs-aurora').config() end }
    use { 'tanvirtin/monokai.nvim', config = function() require('plugin.cs-monokai').config() end }
    use { 'B4mbus/oxocarbon-lua.nvim', config = function() require('plugin.cs-oxocarbon').config() end, after = 'colorscheme-tweaks.nvim' }
    use { 'catppuccin/nvim', config = function() require('plugin.cs-catppuccin').config() end, after = 'colorscheme-tweaks.nvim' }
    use { 'rebelot/kanagawa.nvim', config = function() require('plugin.cs-kanagawa').config() end, after = 'colorscheme-tweaks.nvim' }

    -- # Plugins in test
        --
    use { 'akinsho/bufferline.nvim', config = function() require('plugin.bufferline').config() end, after = 'nvim-notify', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'zakharykaplan/nvim-retrail', config = function() require('plugin.retrail').config() end } -- Removes trailing whitespace from lines
    use 'mbbill/undotree'
    use 'jghauser/mkdir.nvim' --Allows automatic creation of folders in save path
    use { 'folke/twilight.nvim', config = function() require('plugin.twilight').config() end, after = {'nvim-notify', 'nvim-treesitter' } } -- Allows disabling color coding outside of current scope (using treesitter)
    use { 'kevinhwang91/nvim-bqf', config = function() require('plugin.bqf').config() end, after = {'nvim-notify', 'fzf', 'nvim-treesitter' } } -- Enhances the quickfix menu with previews, treesitter, and more
    use { 'chentoast/marks.nvim', config = function() require('marks').setup() end }
    use {'akinsho/toggleterm.nvim', config = function() require('plugin.toggleterm').config() end, after = 'nvim-notify'}
    use { 'simrat39/symbols-outline.nvim', config = function() require('plugin.symbols-outline').config() end, after = 'nvim-notify' }
    use 'moll/vim-bbye' --Closes buffers without modifying splits, part of the mappings

    -- Force a sync if first installed
    if packer_bootstrap then
      require('packer').sync()
    end
  end
  )
end

return M
