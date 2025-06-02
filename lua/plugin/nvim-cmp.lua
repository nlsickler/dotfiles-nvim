-- Setup nvim-cmp.
local moduleLoader = require('utils.moduleLoader')

local M = {}

function M.config()
  local cmpMod = moduleLoader.loadModule('cmp')

  if cmpMod.loaded then
    local cmp = cmpMod.module

    if cmp then
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        mapping = {
          ['<TAB>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources(
          {
            { name = "codecompanion" }, -- Loaded by codeCompanion.lua
            { name = "copilot" }, -- Loaded by copilot_cmp in copilot.lua
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            { name = 'nvim_lsp_signature_help' }
          },
          {
            { name = 'buffer' },
          })
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources(
          { name = 'path' },
          { name = 'cmdline' }
        )
      })
    end
  end
end

return M
