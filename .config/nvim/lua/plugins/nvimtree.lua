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
  require("telescope.builtin").find_files({
    search_dirs = { node.absolute_path },
    find_command = { "rg", "--files", "--hidden", "--no-ignore", "-L" },
  })
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", "Toggle nvimtree" },
    { "<C-f>", ":lua grep_at_current_tree_node()<CR>", "Grep current folder" },
    { "<C-p>", ":lua find_file_at_current_tree_node()<CR>", "find in current folder" },
  },
  opts = {
    git = {
      ignore = false,
    },
    view = {
      side = "right",
    },
    update_focused_file = {
      enable = true,
    },
  },
  -- config = function()
  --   require("nvim-tree").setup({})
  -- end,
}
