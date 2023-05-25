local builtin = require("telescope.builtin")
local telescope = require("telescope")
local grep_args = { "--hidden" }
local actions = require("telescope.actions")
require("telescope").load_extension("git_worktree")

telescope.setup({
	defaults = {
		layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
        },
        vertical = {
          mirror = false,
        },
        width = 0.85,
        height = 0.80,
		},
		sorting_strategy = "ascending",
    file_ignore_patterns = { 'target/*', 'node_modules/*', '^.git/*', '^.yarn/*' },
	},
	pickers = {
		-- current_buffer_fuzzy_find = {
		-- 	previewer = true,
		-- 	layout_strategy = "horizontal",
		-- },
		find_files = {
			find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			previewer = false,
			shortern_path = true,
			layout_strategy = "horizontal",
      theme = "dropdown",
		},
		git_files = {
			previewer = false,
			shortern_path = true,
			layout_strategy = "horizontal",
      theme = "dropdown",
		},
		live_grep = {
			additional_args = function(opts)
				return grep_args
			end,
		},
		grep_string = {
			additional_args = function(opts)
				return grep_args
			end,
		},
		buffers = {
			sort_mru = true,
			mappings = {
      theme = "dropdown",
				i = { ["<c-d>"] = actions.delete_buffer },
			},
		},
    git_worktree = {
      theme = "dropdown",
    },
	},
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pgf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pgb", builtin.git_branches)
vim.keymap.set("n", "<leader>pgs", builtin.git_status)
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})

vim.keymap.set("n", "<leader>pw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")

