return {
  { "sainnhe/gruvbox-material" },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    -- you can do it like this with a config function
    config = function()
      require("catppuccin").setup({
        transparent_background = false,
        -- configurations
        integrations = {
          nvimtree = {
            enabled = true,
            transparent_panel = false,
          },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = false, -- lazyvim.config.keymaps
        options = true, -- lazyvim.config.options
      },
    },
  },
}
