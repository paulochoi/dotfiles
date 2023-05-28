require("mini.ai").setup()
require("mini.indentscope").setup()
require("mini.pairs").setup()
require("mini.surround").setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "Sa", -- Add surrounding in Normal and Visual modes
		delete = "Sd", -- Delete surrounding
		find = "Sf", -- Find surrounding (to the right)
		find_left = "SF", -- Find surrounding (to the left)
		highlight = "Sh", -- Highlight surrounding
		replace = "Sr", -- Replace surrounding
		update_n_lines = "Sn", -- Update `n_lines`

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
