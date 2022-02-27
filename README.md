# LUA based 

An old copy of init.vim lives in this folder, but it shouldn't be used for newer versions of neovim (>= 0.5.0).

## Things to remember

For each language you'll need to `LspInstall` to get a language server loaded.
You *must* also add a configuration for it once installed to the plugins-nvim-cmp.lua config file to get completion.

## Plugin Things

### nvim-dap

Requires a download/install of the [necessary debug adapter](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation) 

* netcoredbg - assumed to be on the path

### lualine

#### Audio Status

Currently uses [spotify-tui](https://github.com/Rigellute/spotify-tui) to get status.  Required to be on the path (and needs to be configured with a developer account)

