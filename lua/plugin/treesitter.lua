local mLoader = require('utils.moduleLoader')

local M = {}

M.config = function()
  local treesitterConf = mLoader.loadModule('nvim-treesitter.configs')

  vim.notify('Loading treesitter configuration', 'info')
  if treesitterConf.loaded then

    -- Treesitter configuration
    treesitterConf.module.setup {
      ensure_installed = {
        'beancount',
        'bibtex',
        'c',
        'clojure',
        'cmake',
        'comment',
        'commonlisp',
        'cpp',
        'css',
        'cuda',
        'dart',
        'dockerfile',
        'dot',
        'eex',
        'elixir',
        'erlang',
        'fennel',
        'fish',
        'fusion',
        'gdscript',
        'gleam',
        'glimmer',
        'glsl',
        'go',
        'gomod',
        'gowork',
        'graphql',
        'hcl',
        'heex',
        'hjson',
        'hocon',
        'html',
        'http',
        'java',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'julia',
        'kotlin',
        'lalrpop',
        'latex',
        'ledger',
        'llvm',
        'make',
        'ninja',
        'nix',
        'norg',
        'ocaml_interface',
        'ocaml',
        'pascal',
        'perl',
        'php',
        'pioasm',
        'prisma',
        'pug',
        'python',
        'ql',
        'query',
        'r',
        'rasi',
        'regex',
        'rst',
        'ruby',
        'rust',
        'scala',
        'scss',
        'sparql',
        'supercollider',
        'surface',
        'svelte',
        'tlaplus',
        'toml',
        'tsx',
        'turtle',
        'typescript',
        'vala',
        'vim',
        'vue',
        'yaml',
        'yang',
        'zig',
      },

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      indent = { 
        enable = true, 
      },
    }

    --M.loadLanguageSettings('lua')
    M.loadLanguageSettings('c_sharp')
  end
end

M.loadLanguageSettings = function(name)
  local module = mLoader.loadModule('plugin.tsconf.'..name)

  if module.loaded then
    module.module.config()
  end
end

return M
