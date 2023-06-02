require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
require("mini.surround").setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "ta", -- Add surrounding in Normal and Visual modes
		delete = "td", -- Delete surrounding
		find = "tf", -- Find surrounding (to the right)
		find_left = "tF", -- Find surrounding (to the left)
		highlight = "th", -- Highlight surrounding
		replace = "tr", -- Replace surrounding
		update_n_lines = "tn", -- Update `n_lines`

		suffix_last = "l", -- Suffix to search with "prev" method
		suffix_next = "n", -- Suffix to search with "next" method
	},
})
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
