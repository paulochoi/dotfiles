local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local grep_args = { "--hidden" }
local Util = require("lazyvim.util")
local utils = require("telescope.utils")

require("telescope").load_extension("neoclip")
vim.api.nvim_set_keymap(
  "n",
  "<leader>pc",
  ":Telescope neoclip star<CR>",
  { noremap = true, silent = true, desc = "Open neoclip" }
)

return {
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = function()
    return {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      {
        "<leader>pF",
        function()
          builtin.find_files({ cwd = utils.buffer_dir() })
        end,
        desc = "Find files in cwd",
      },
      { "<leader>p:", "<cmd>Telescope command_history<cr>", desc = "Find Files" },
      { "<leader>pb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>pd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>pD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>pgf", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
      { "<leader>pk", "<cmd>Telescope keymaps<cr>", desc = "Find Key Maps" },
      { "<leader>pm", "<cmd>Telescope marks<cr>", desc = "Find Marks" },
      { "<leader>pq", "<cmd>Telescope quickfix<cr>", desc = "Find in Quickfix" },
      { "<leader>pr", "<cmd>Telescope lsp_references<cr>", desc = "Find LSP References" },
      { "\\", "<cmd>Telescope resume<cr>", desc = "Resume telescope" },
      { "<leader>px", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find In Current Buffer" },
      { "<leader>pe", "<cmd>:lua require('telescope').extensions.emoji.emoji()<cr>", desc = "Find In Current Buffer" },
      { "<leader>prf", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>pgs", "<cmd>Telescope git_status<CR>", desc = "status" },
      {
        "<leader>ps",
        function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Find Files",
      },
      {
        "<leader>pS",
        function()
          builtin.grep_string({ search = vim.fn.input("Grep > "), cwd = utils.buffer_dir() })
        end,
        desc = "Find Files (cwd)",
      },
    }
  end,
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-BS>"] = function()
            vim.api.nvim_input("<C-w>")
          end,
          ["<C-h>"] = "which_key",
        },
        n = {
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
      sorting_strategy = "ascending",
      file_ignore_patterns = { "target/*", "node_modules/*", "^.git/*", "^.yarn/*" },
    },
    extensions = {
      emoji = {
        action = function(emoji)
          vim.fn.setreg("*", emoji.value)
        end,
      },
    },
    pickers = {
      current_buffer_fuzzy_find = {
        previewer = true,
      },
      command_history = {
        sorting_strategy = "descending",
        previewer = false,
        layout_config = {
          prompt_position = "top", -- search bar at the top
        },
      },
      find_files = {
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        previewer = false,
        shortern_path = true,
        theme = "dropdown",
      },
      oldfiles = {
        previewer = false,
        shortern_path = true,
        theme = "dropdown",
      },
      git_files = {
        previewer = false,
        shortern_path = true,
        theme = "dropdown",
      },
      live_grep = {
        additional_args = function()
          return grep_args
        end,
      },
      grep_string = {
        additional_args = function()
          return grep_args
        end,
      },
      buffers = {
        mappings = {
          i = { ["<c-d>"] = actions.delete_buffer },
        },
      },
    },
  },
}
