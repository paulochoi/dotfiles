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
    },
    suggestion = {
      enabled = true,
      hide_during_completion = true,
      auto_trigger = true,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = true },
    filetypes = {
      markdown = false,
      help = true,
    },
  },
}
