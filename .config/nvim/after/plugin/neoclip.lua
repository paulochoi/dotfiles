require("neoclip").setup({
  default_register = { '"', '+', '*' },
  on_select = {
    set_reg = true,
    move_to_front = false,
    close_telescope = true,
  },
})

require("telescope").load_extension("neoclip")
vim.api.nvim_set_keymap(
	"n",
	"<leader>pc",
	":Telescope neoclip star<CR>",
	{ noremap = true, silent = true, desc = "Open neoclip" }
)
