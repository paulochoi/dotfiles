require('gitsigns').setup()

vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<CR>") 
vim.keymap.set("n", "<leader>hn", "<cmd>Gitsigns next_hunk<CR>")

