local fn = require('core.functions')
local keymap = fn.load_json('keymap')

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

-- use keymaps from keymap.json
for _, k in ipairs(keymap) do
	vim.keymap.set(k[1], k[2], k[3])
end
