vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>")
-- my custom mappings
vim.keymap.set("n", "÷", "a")
vim.keymap.set("i", "÷", "<Esc>")
vim.keymap.set("n", "<leader>r", "viwc")
vim.keymap.set("i", "<C-d>", "<Delete>")
-- horizontal navigation
vim.keymap.set({ "n", "v" }, ",", "b")
vim.keymap.set({ "n", "v" }, ".", "w")
vim.keymap.set({ "i", "n", "v" }, "≤", "<Left>")
vim.keymap.set({ "i", "n", "v" }, "≥", "<Right>")

-- move lines JK in V mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join lines without moving a cursor
vim.keymap.set("n", "J", "mzJ`z")

-- scrolling
-- vim.keymap.set("n", "<C-j>", "<C-d>zz")
-- vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "10j")
vim.keymap.set("n", "<C-k>", "10k")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "v" }, "<C-z>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- rename var
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
