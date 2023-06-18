require('gitsigns').setup()

vim.keymap.set("n", "hp", "<cmd>Gitsigns prev_hunk<CR>") 
vim.keymap.set("n", "hn", "<cmd>Gitsigns next_hunk<CR>")

