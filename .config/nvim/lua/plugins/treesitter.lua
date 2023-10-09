return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "HiPhish/nvim-ts-rainbow2" },
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    end
    opts.rainbow = {
      enable = true,
      query = "rainbow-parens",
      strategy = require("ts-rainbow").strategy.global,
    }
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
  end,
}
