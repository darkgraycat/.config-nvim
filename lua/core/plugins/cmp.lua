local cmp = require('cmp')
local luasnip = require('luasnip')
local mappings = require('core.mappings')
require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt = 'menu,menuone,noselect'

mappings.set_keymap({'i', 's'}, mappings.common_keys.next_item_alt, function() luasnip.jump( 1) end)
mappings.set_keymap({'i', 's'}, mappings.common_keys.prev_item_alt, function() luasnip.jump(-1) end)

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-q>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
})
