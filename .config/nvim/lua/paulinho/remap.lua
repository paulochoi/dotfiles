vim.g.mapleader = " "

-- my custom mappings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<Esc><BS>", "<C-w>")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "p", "P")
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "J", "10jzz")
vim.keymap.set("n", "K", "10kzz")
vim.keymap.set("n", "<leader>rt", ":NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format({ async = true })<CR>")

vim.keymap.set("n", "<leader>f", ":Prettier<CR>", { desc = "Format with Prettier" })

vim.keymap.set("n", "<leader>vf", "$V%")

vim.keymap.set("n", "<leader>cf", ":let @*=expand('%')<cr>")
vim.keymap.set("n", "<leader>cF", ":let @*=expand('%:t')<cr>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tl", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>th", ":tabp<CR>") --  go to previous tab
vim.keymap.set("n", "<leader>n", ":noh<CR>")

-- plugin keymaps
-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "qc", ":cclose<CR>")
vim.keymap.set("n", "qo", ":copen<CR>")
vim.keymap.set("n", "<leader>k", ":move .-2<CR>")
vim.keymap.set("n", "<leader>j", ":move .+1<CR>")

vim.keymap.set("v", "<leader>k", ":move '<-2<CR>gv=gv")
vim.keymap.set("v", "<leader>j", ":move '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>cr", "<cmd>lua ReloadConfig()<CR>")
vim.keymap.set("n", "<leader>b", ":BlamerToggle<CR>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
