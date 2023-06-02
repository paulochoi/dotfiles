require("neoclip").setup({
	default_register = { '"', "+", "*" },
	on_select = {
		set_reg = true,
		move_to_front = false,
		close_telescope = true,
	},
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-l>",
				paste_behind = "<c-k>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				edit = "<c-e>", -- edit an entry
				custom = {},
			},
		},
	},
})

require("telescope").load_extension("neoclip")
vim.api.nvim_set_keymap(
	"n",
	"<leader>pc",
	":Telescope neoclip star<CR>",
	{ noremap = true, silent = true, desc = "Open neoclip" }
)
