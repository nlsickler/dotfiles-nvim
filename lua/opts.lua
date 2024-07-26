-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Editor Settings
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.autoread = true

-- Wrapping
vim.opt.wrap = false
vim.opt.linebreak = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
--vim.opt.smarttab = true

vim.cmd [[set list listchars=tab:→\ ,extends:⟫,precedes:⟪,nbsp:·,trail:⁐,space:⋅,eol:⁋]]

vim.opt.scrolloff=4
vim.opt.sidescrolloff=4

--Mouse Settings
vim.opt.mouse = 'a'
-- vim.opt.mousemodel = 'extend'
vim.opt.ruler = true
vim.opt.wildmenu = true

-- Window Settings
vim.o.winwidth = 20
vim.o.winminwidth = 10
vim.o.equalalways = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 3 -- Makes the statusbar window-wide and not isoldated to a buffer
-- vim.cmd([[set winbar=%y%=%r\ %f\ %m%=%l\:%L]]) -- A winbar layout showing status, location, etc per file replaced with lualine

-- Folds
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldnestmax = 5
vim.opt.foldminlines = 5

-- Misc
vim.opt.cursorline = true
vim.opt.termguicolors = true -- Required by many plugins
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.updatetime = 300 --faster completion/highlighting 4000ms default
vim.opt.history = 50
vim.opt.helplang = 'en'
vim.opt.lazyredraw = true -- Prevents redrawing the screen while executing macros :redraw will force an update
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
vim.cmd([[set guifont=LiterationMono\ NF:h14]])

-- Configure some filetype redirects for syntax highlighting
vim.cmd([[au BufReadPost *.xaml set syntax=xml]])
