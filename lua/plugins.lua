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
    -- use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function() require('plugin.nvim-tree').config() end, after = 'nvim-notify'}
    use 'ryanoasis/vim-devicons' -- Adds git icons to NERDTree, lightline, vim-startify, etc
    use { 'nvim-lualine/lualine.nvim', config = function() require('plugin.lualine').config() end, after = 'nvim-notify' } -- Powerline/Airline alterative for bottom status bar
    -- use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', config = function() require('plugin.bufferline').config() end, after = 'nvim-notify' }
    use {'noib3/nvim-cokeline', requires = 'kyazdani42/nvim-web-devicons', config = function() require('plugin.cokeline').config() end, after = 'nvim-notify' }
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
    use 'p00f/nvim-ts-rainbow' -- Different colored closing brackets, etc.
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

    -- Color Schemes
    use 'nlsickler/vim-colors-pencil' -- Customized color scheme
    use 'nlsickler/vim-monokai-pro'
    use 'nlsickler/tokyonight-custom'
    -- use { 'nlsickler/colorscheme_template.nvim', branch = 'test-theme'}
    -- use { 'folke/tokyonight.nvim' }
    use 'reewr/vim-monokai-phoenix'
    use 'tomasr/molokai'
    use 'NLKNguyen/papercolor-theme'
    use 'EdenEast/nightfox.nvim'

    -- # Plugins in test

    -- Force a sync if first installed
    if packer_bootstrap then
      require('packer').sync()
    end
  end
  )
end

return M
