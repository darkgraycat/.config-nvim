local fn = require('core.functions')
local mappings = fn.load_json('mappings')

-- basic hardcoded keymaps
vim.g.mapleader = ' '
vim.keymap.set('v', '<leader>y', [["+y]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "v" }, "<C-z>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>nh", ':nohl<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

local default_opts = { noremap = true }
local function keymap(mode, kb, cmd, desc)
  local opts = default_opts
  if desc ~= nil then opts.desc = desc end
  vim.keymap.set(mode, kb, cmd, opts)
end

-- use keymaps from mappings.json
for _, k in ipairs(mappings) do
  keymap(k[1], k[2], k[3], k[4])
end

