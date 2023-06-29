return {
  "AckslD/nvim-neoclip.lua",
  opts = {
    keys = {
      default_register = { '"', "+", "*" },
      on_select = {
        set_reg = true,
        move_to_front = false,
        close_telescope = true,
      },
      telescope = {
        i = {
          select = "<cr>",
          paste = "<c-l>",
          paste_behind = "<c-k>",
          replay = "<c-q>", -- replay a macro
          delete = "<c-d>", -- delete an entry
          edit = "<c-e>", -- edit an entry
          custom = {},
        },
      },
    },
  },
}
