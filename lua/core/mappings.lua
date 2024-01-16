local fn = require('core.functions')
local mappings_file = fn.load_json('mappings')

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

-- local function mappings_print()
--   print(vim.fn.json_decode(mappings_file))
-- end
--
-- vim.keymap.set('n', 'lhs', function() mappings_print() end)

local default_opts = { noremap = true }
local function set_keymap(mode, kb, cmd, desc)
  local opts = default_opts
  if desc ~= nil then opts.desc = desc end
  vim.keymap.set(mode, kb, cmd, opts)
end

-- use keymaps from mappings.json
for _, k in ipairs(mappings_file) do
  set_keymap(k[1], k[2], k[3], k[4])
end

local common_keys = {
  next_item = '<Tab>',
  prev_item = '<S-Tab>',
  next_item_alt = '<M-.>',
  prev_item_alt = '<M-,>',
}

return {
  common_keys = common_keys,
  set_keymap = set_keymap,
}
