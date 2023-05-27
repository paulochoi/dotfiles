require("mini.ai").setup()
require("mini.comment").setup()
require("mini.indentscope").setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require("mini.move").setup({
	mappings = {
		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = "<leader>h",
    right = "<leader>l",
    up = "<leader>k",
    down = "<leader>j",

		-- Move current line in Normal mode
		line_left = "<leader>h",
		line_right = "<leader>l",
		line_down = "<leader>j",
    line_up = "<leader>k",
	},
})

