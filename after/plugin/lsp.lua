vim.opt.signcolumn = 'yes'

local inlay_hints = require("inlay-hints")

local lsp = require("lsp-zero").preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = '',
    }
})

lsp.ensure_installed({
    'rust_analyzer',
    'tsserver',
    'eslint',
})

--lsp.skip_server_setup({ 'rust_analyzer' })

local cmp = require('cmp')

lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --['<Tab>'] = nil,
        --['<S-Tab>'] = nil,
    }),
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 2 },
        { name = 'luasnip', keyword_length = 3 },
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
    },
})

lsp.on_attach(function(client, bufnr)
    print('LSP attached')
    local opts = { buffer = bufnr, remap = false }
    inlay_hints.on_attach(client)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

inlay_hints.setup({
  renderer = "inlay-hints/render/eol",
  eol = {
    parameter = {
      separator = ", ",
      format = function(h) return string.format(" <- (%s)", h) end,
    },
    type = {
      separator = ", ",
      format = function(h) return string.format(" => (%s)", h) end,
    }
  }
})
lsp.setup()

--require('rust-tools').setup({ server = rust_lsp })
--require('rust-tools').setup()

vim.diagnostic.config({
    virtual_text = true
})
