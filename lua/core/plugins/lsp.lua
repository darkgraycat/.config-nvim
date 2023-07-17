local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspsaga = require('lspsaga')
local navic = require('nvim-navic')

local lsps = { 'rust_analyzer', 'tsserver', 'html', 'cssls', 'eslint', 'lua_ls' }

mason.setup()
mason_lspconfig.setup({ ensure_installed = lsps })
navic.setup({
  highlight = true,
  separator = ' ',
  depth_limit = 0,
  depth_limit_indicator = '…',
  safe_output = true,
})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

for _, lsp in ipairs(lsps) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach =  on_attach,
  })
end

lspsaga.setup({
  definition_action_keys = {
    edit = '<CR>',
  }
})
