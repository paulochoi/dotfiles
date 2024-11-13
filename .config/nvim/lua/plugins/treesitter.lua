return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {},
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    end
    opts.textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["gn"] = { query = "@function.outer", desc = "🌲go to next function" },
        },
        goto_previous_start = {
          ["gp"] = { query = "@function.outer", desc = "🌲go to previous function" },
        },
      },
    }
    return {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    }
  end,
}
