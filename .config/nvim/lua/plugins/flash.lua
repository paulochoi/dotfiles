return {
  "folke/flash.nvim",
  opts = {
    search = {
      mode = function(str)
        return "\\<" .. str
      end,
      multi_window = false,
    },
  },
}
