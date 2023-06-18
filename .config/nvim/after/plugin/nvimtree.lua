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
	require("telescope.builtin").find_files({ search_dirs = { node.absolute_path } })
end

-- open nvim-tree on setup
local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.keymap.set("n", "<leader>rt", ":NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
