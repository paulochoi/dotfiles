-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- configure nvim-tree
nvimtree.setup({
	git = {
		ignore = false,
	},
	view = {
		side = "right",
		mappings = {
			list = {
				{
					key = { "<C-f>", "<C-f>" },
					cb = ":lua grep_at_current_tree_node()<CR>",
					mode = "n",
				},
				{
					key = { "<C-p>", "<C-p>" },
					cb = ":lua find_file_at_current_tree_node()<CR>",
					mode = "n",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
	},
})

-- allows to run telescope on the current directory
function grep_at_current_tree_node()
	local node = require("nvim-tree.lib").get_node_at_cursor()
	if not node then
		return
	end
	require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
end

function find_file_at_current_tree_node()
	local node = require("nvim-tree.lib").get_node_at_cursor()
	if not node then
		return
	end
	require("telescope.builtin").find_files({ search_dirs = { node.absolute_path }, find_command = { "rg", "--files", "--hidden", "--no-ignore", "-L" } })
end

vim.keymap.set("n", "<leader>rt", ":NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
