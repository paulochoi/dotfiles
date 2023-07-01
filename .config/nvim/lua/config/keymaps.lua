-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")
vim.g.mapleader = " "

-- my custom mappings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<Esc><BS>", "<C-w>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("v", "J", "gJ")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "p", "P")
vim.keymap.set("v", "y", "ygv<Esc>")
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "J", "10jzz")
vim.keymap.set("n", "K", "10kzz")
-- vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>")
vim.keymap.set("n", "<cr>", "ciw")
vim.keymap.set("v", "<cr>", "c")
vim.keymap.set("n", "<BS>", ":b#<CR>", { silent = true })
vim.keymap.set("n", "<leader>cb", "%bd | e#<CR>")

vim.keymap.set("n", "<leader>vf", "$V%")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>ss", "<C-w>r") -- swap current split window with the one on the other side
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>n", ":noh<CR>")

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tl", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>th", ":tabp<CR>") --  go to previous tab

-- plugin keymaps
-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "qc", ":cclose<CR>")
vim.keymap.set("n", "qo", ":copen<CR>")
vim.keymap.set("c", "<M-BS>", "<C-w>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>cr", "<cmd>lua ReloadConfig()<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "<leader>us", function()
  Util.toggle("spell")
end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
