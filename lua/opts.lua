-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Editor Settings
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Wrapping
vim.opt.wrap = false
vim.opt.linebreak = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars='tab:→ ,trail:•'


vim.opt.scrolloff=4
vim.opt.sidescrolloff=4

--Mouse Settings
vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.ruler = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Folds
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldnestmax = 5
vim.opt.foldminlines = 5

-- Misc
vim.opt.cursorline = true
vim.opt.termguicolors = true -- Required by bufferline
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.updatetime = 300 --faster completion/highlighting 4000ms default
vim.opt.history = 250
vim.opt.helplang = 'en'
vim.opt.lazyredraw = true -- Prevents redrawing the screen while executing macros :redraw will force an update
vim.opt.list = false
vim.opt.autochdir = false
vim.opt.spell = false
vim.opt.belloff = 'all'
vim.opt.backspace = 'indent,eol,start'  --Default values for nvim, but not for vim classic
vim.opt.virtualedit = 'block'

-- Colorscheme
vim.opt.background = 'dark'

-- Help Tags: shell-powershell
-- vim.cmd [[set shell=\"C:/Program\ Files/PowerShell/7/pwsh.exe\"]] -- This works but is machine specific
vim.opt.shell = 'pwsh'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.cmd([[set shellquote= shellxquote=]])

-- Configure some filetype redirects for syntax highlighting
vim.cmd([[au BufReadPost *.xaml set syntax=xml]])

-- vim.cmd([[colorscheme nightfox]])
