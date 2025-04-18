return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/paulinho",
      },
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
    disable_frontmatter = true,
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    -- key mappings, below are the defaults
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ["gd"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      -- ["<leader>ch"] = {
      --   action = function()
      --     return require("obsidian").util.toggle_checkbox()
      --   end,
      --   opts = { buffer = true },
      -- },
    },
  },
}
