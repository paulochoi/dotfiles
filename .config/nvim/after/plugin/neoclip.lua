require("neoclip").setup({
	preview = true,
	false,
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "P",
				paste_behind = "<c-k>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				edit = "<c-e>", -- edit an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				--- It is possible to map to more than one key.
				-- paste = { 'p', '<c-p>' },
				paste_behind = "P",
				replay = "q",
				delete = "d",
				edit = "e",
				custom = {},
			},
		},
	},
})
require("telescope").load_extension("neoclip")
vim.api.nvim_set_keymap(
	"n",
	"<leader>pc",
	":Telescope neoclip<CR>",
	{ noremap = true, silent = true, desc = "Open neoclip" }
)
