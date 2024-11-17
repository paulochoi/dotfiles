return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  keys = {
    { "<leader>cp", "<cmd>Copilot panel<cr>", "Launches copilot panel" },
  },
  opts = {
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<C-l>",
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      accept_line = false,
      accept_word = false,
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
